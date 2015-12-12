class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.all
    @videos_fashion = Video.where("category like ?", "%fashion%")
    @videos_editorial = Video.where("category like ?", "%editorial%")
    @videos_behind = Video.where("category like ?", "%behind%")
    @videos_week = Video.where("category like ?", "%week%")  
    @videos_short = Video.where("category like ?", "%short%") 
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @videos = Video.all
    @videos_fashion = Video.where("category like ?", "%fashion%")
    @videos_editorial = Video.where("category like ?", "%editorial%")
    @videos_behind = Video.where("category like ?", "%behind%")
    @videos_week = Video.where("category like ?", "%week%")  
    @videos_short = Video.where("category like ?", "%short%") 
    
    
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
