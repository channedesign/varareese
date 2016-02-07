class VideosController < ApplicationController
  before_action :authenticate_admin!
  before_action :videos_order, except: [:new, :destroy]
  before_action :video_with_id, only: [:edit, :update]

  def index
    @video_show = Video.where(name: "Reel").first
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admins_video_path, notice: "Video uploaded successfully"
    else
      render template: "admins/video", alert: "Video NOT uploaded"
    end
  end

  def edit
  end

  def update
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
      params.require(:video).permit(:name, :link, {video_category_ids: []}, :mag, :mag_link, :position, :intro_text)
    end

    def videos_order
      @videos = Video.order("position ASC")
    end

    def video_with_id
      @video = Video.find(params[:id])
    end

end
