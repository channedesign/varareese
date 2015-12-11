class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.all
    @videos_fashion = Video.where("category like ?", "%fashion%")
    @videos_editorial = Video.where("category like ?", "%editorial%")
    @videos_behind = Video.where("category like ?", "%behind%")
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @videos = Video.all

    
    
    if @video.save
      flash[:notice] = "Video uploaded successfully"
      redirect_to admins_video_path
    else
      flash[:alert] = "Video NOT uploaded"
      render template: "admins/video"
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update_attributes(video_params)
      flash[:notice] = "Video edited successfully"
      redirect_to admins_video_path
    else
      flash[:alert] = "Video NOT edited"
      render "edit"
    end
  end

  def destroy
    @video = Video.find(params[:id]).destroy
    flash[:notice] = "Video deleted successfully"
    redirect_to admins_video_path
  end

  private
    def video_params
      params.require(:video).permit(:name, :category, :link)
    end

end
