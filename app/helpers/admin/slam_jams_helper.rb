module Admin::SlamJamsHelper
  def embed_youtube(youtube_id)
    params = { wmode: 'transport', html5: 1 }
    url = "http://www.youtube.com/embed/#{youtube_id}?#{params.to_query}"

    content_tag(:iframe, '',
                title: 'Slam Nation Station',
                width: 640,
                height: 480,
                type: 'text/html',
                frameborder: '0',
                src: url)
  end

  def admin_slam_jams_submit_url(slam_jam)
    if slam_jam.persisted?
      admin_slam_jam_url(slam_jam)
    else
      admin_slam_jams_url
    end
  end
end
