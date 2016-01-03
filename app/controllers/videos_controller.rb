class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.order("position ASC")
    @video_show = Video.where(name: "Reel").first
    
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @videos = Video.order("position ASC")
    
    if @video.save
      redirect_to admins_video_path, notice: "Video uploaded successfully"
    else
      render template: "admins/video", alert: "Video NOT uploaded"
    end
  end

  def edit
    @video = Video.find(params[:id])
    @videos = Video.order("position ASC")
  end

  def update
    @video = Video.find(params[:id])
    @videos = Video.order("position ASC")

    if @video.update_attributes(video_params)
      redirect_to admins_video_path, notice: "Video edited successfully"
    else
      render "edit", alert: "Video NOT edited"
    end
  end

  def destroy
    @video = Video.find(params[:id]).destroy
    redirect_to admins_video_path, notice: "Video deleted successfully"
  end

  private
    def video_params
      params.require(:video).permit(:name, :link, {video_category_ids: []}, :mag, :mag_link, :position)
    end

end
