require 'spec_helper' 
require "#{Rails.root}/lib/tasks/slam_jam_helpers" 

describe SlamJamHelpers do

  describe "Image Addition" do
    let(:slam) { SlamJam.first } 

    # We don't want to run add_image too much for the tests.
    # Only get 5000 queries a month.
    before(:all) do 
      @record = FactoryGirl.create(:slam_jam)
      SlamJamHelpers.add_images(1) 
    end

    after(:all) { @record.destroy }

    it "adds a well formed image attribute to the item" do 
      slam.img_url.should_not be_blank
      expect { URI.parse(slam.img_url) }.to_not raise_error 
      URI.parse(slam.img_url).kind_of?(URI::HTTP).should be true
    end 
  end
end 

