class VideosController < ApplicationController
  before_action :authenticate_admin!
  before_action :sorted_video, only: [:index, :create]

  def index
    @videos = Video.all
    
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @videos = Video.all
    
    if @video.save
      redirect_to admins_video_path, notice: "Video uploaded successfully"
    else
      render template: "admins/video", alert: "Video NOT uploaded"
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

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
      params.require(:video).permit(:name, :category, :link)
    end

end
