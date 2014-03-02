class StaticController < ApplicationController

  def home
    @slam_jam = SlamJam.all.first
  end
end
