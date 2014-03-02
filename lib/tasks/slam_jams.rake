require "#{Rails.root}/lib/tasks/slam_jam_helpers"

namespace :slam_jams do 
  task :populate => :environment do
    if !ENV['pages'] || (ENV['pages'].to_i <= 0)
      raise "pass a pages option greater than zero." 
    end

    SlamJamHelpers.access_and_populate(ENV['pages'].to_i)
  end

  task :add_images => :environment do 
    SlamJamHelpers.add_images(SlamJam.count) 
  end
end