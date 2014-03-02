require 'youtube_search'

class SlamJamHelpers
  ARTIST_REGEX = [ /\(Quad City DJ'?s vs\.? (.*)\)/i,
                   /Quad City DJ'?s vs\.? ([^\-]*)$/i,
                   /^Quad City DJ'?s vs\.? ([^\-]*)/i ]

  def self.no_artist_logger 
    @@no_artist_logger ||= Logger.new("#{Rails.root}/log/no_artist.log") 
  end

  def self.no_image_logger 
    @@no_image_logger ||= Logger.new("#{Rails.root}/log/no_image.log") 
  end

  def self.access_and_populate(pages)
    puts "Grabbing #{pages} pages worth of results"

    Array(1..pages).each do |n|
      puts "Processing results, page #{n} of #{pages}" 
      begin  
        params = { :per_page => 25, :page => (n unless n == 1)} 
        YoutubeSearch.search('title: "Quad City Djs vs"', params).each do |video|
          id = video["video_id"] 
          artist = artist_from_title(video["title"])
          title = video["title"]

          if !artist 
            no_artist_logger.info "Could not infer artist name from #{title}"
          else
            vid = SlamJam.find_or_create_by(:youtube_id => id)
            vid.artist = artist
            vid.title = title
            vid.save!
          end
        end
      rescue OpenURI::HTTPError
        puts "Bad request.  Page #{n}" 
        no_artist_logger.warn "Bad request. Page #{n}"
        break
      end
    end
  end

  def self.add_images(num)

    successful = num

    SlamJam.first(num).each do |slam|
      if slam.img_url.blank?
        # Return a single result, size large, with safe search on.
        client = Binged::Client.new.image 
        client.large.safe_search(:strict).per_page(1)
        client.query[:Query] = [slam.artist]

        if client.fetch.results.length == 1
          slam.img_url = client.fetch.results.first.media_url
          slam.save!
          print "." 
        else 
          successful = successful - 1
          no_image_logger.warn "Couldn't find any images for object #{slam.id} with artist #{slam.artist}"
          print "F" 
        end
      end
    end
    puts "#{successful} of #{num} slams in the database tagged with images"  
  end 


  private

    def self.artist_from_title(title)
      regexp = ARTIST_REGEX.find {|regexp| regexp.match(title) }
      regexp.match(title)[1] if regexp
    end
end
