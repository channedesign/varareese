class VideosController < ApplicationController
  before_action :authenticate_admin!
  before_action :video_with_id, only: [:edit, :update, :destroy]

  respond_to :json

  def index
    respond_with Video.order_by_position, status: 200
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      respond_with @video, status: 200
    else
      respond_with errors: @video.errors.full_messages, status: 422
    end
  end

  def edit
    respond_with @video
  end

  def update
    respond_with @video.update(video_params), status: 200
  end

  def destroy
    respond_with @video.destroy, status: 200
  end

  def sort
    puts "params => #{params.inspect}" 
    params[:video].each_with_index do |id, index|
      Video.where(id: id).update_all({position: index + 1})
    end
    render nothing: true
  end

  private
    def video_params
      params.require(:video).permit(:name, :link, :video_category_id, :mag, :mag_link, :position, :intro_text, :id, :created_at, :updated_at, :thumb_link )
    end

    def video_with_id
      @video = Video.find(params[:id])
    end

end
