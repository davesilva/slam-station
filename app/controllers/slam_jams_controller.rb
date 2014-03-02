class SlamJamsController < ApplicationController
  def slam
    user = current_or_guest_user
    slam_jams = user.desirable_slam_jams

    @slam_jam = slam_jams.random
    user.slam!(@slam_jam)

    respond_to do |format|
      format.json { render json: @slam_jam }
    end
  end

  def like
    @slam_jam = SlamJam.find(params[:id])

    if params[:slam_jam][:liked] == 'true'
      current_or_guest_user.like(@slam_jam)
    else
      current_or_guest_user.unlike(@slam_jam)
    end

    respond_to do |format|
      format.js
    end
  end

  def dislike
    @slam_jam = SlamJam.find(params[:id])

    if params[:slam_jam][:disliked] == 'true'
      current_or_guest_user.dislike(@slam_jam)
    else
      current_or_guest_user.undislike(@slam_jam)
    end

    respond_to do |format|
      format.js
    end
  end
end
