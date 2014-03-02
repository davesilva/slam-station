class Admin::SlamJamsController < ApplicationController
  http_basic_authenticate_with name: 'admin',
                               password: Rails.configuration.admin_password
  before_action :set_slam_jam, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  # GET /admin/slam_jams
  # GET /admin/slam_jams.json
  def index
    @slam_jams = SlamJam.all
  end

  # GET /admin/slam_jams/new
  def new
    @slam_jam = SlamJam.new
  end

  # GET /admin/slam_jams/1/edit
  def edit
  end

  # POST /admin/slam_jams
  # POST /admin/slam_jams.json
  def create
    @slam_jam = SlamJam.new(slam_jam_params)

    flash[:notice] = 'Slam Jam added.' if @slam_jam.save

    respond_with @slam_jam, location: admin_slam_jams_url
  end

  # PATCH/PUT /admin/slam_jams/1
  # PATCH/PUT /admin/slam_jams/1.json
  def update
    flash[:notice] = 'Slam Jam updated.' if @slam_jam.update(slam_jam_params)

    respond_with @slam_jam, location: admin_slam_jams_url
  end

  # DELETE /admin/slam_jams/1
  # DELETE /admin/slam_jams/1.json
  def destroy
    @slam_jam.destroy

    respond_with @slam_jam, location: admin_slam_jams_url
  end

  private

  def set_slam_jam
    @slam_jam = SlamJam.find(params[:id])
  end

  def slam_jam_params
    params.require(:slam_jam)
          .permit(:youtube_id, :artist, :title, :img_url, :approved)
  end
end
