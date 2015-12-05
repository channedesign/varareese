class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.all
  end

  def show

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
  end

  def update
  end

  def destroy
  end

  private
    def video_params
      params.require(:video).permit(:name, :category, :link)
    end

end
