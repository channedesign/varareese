class PhotosController < ApplicationController
  before_action :authenticate_admin!
  before_action :photo_all, only: [:index, :edit]
  before_action :photo_with_id, only: [:edit, :update]
  def index
    @photo_show = Photo.where(name: "Reel").first
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: { message: "success", fileID: @photo.id }, :status => 200
    else
      render json: { error: @photo.errors.full_messages.join(',')}, :status => 400
    end
  end

  def edit
  end

  def update

    if @photo.update_attributes(photo_params)
      flash[:notice] = "Photo edited successfully"
      redirect_to admins_photo_path
    else
      flash[:alert] = "Photo NOT edited"
      render "edit"
    end
  end

  def destroy
    @photo = Photo.find(params[:id]).destroy
    flash[:notice] = "Poto deleted successfully"
    redirect_to admins_photo_path
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :photo, {photo_category_ids: []}, :photo_original_w, :photo_original_h, :photo_box_w, :photo_crop_x, :photo_crop_y, :photo_crop_w, :photo_crop_h, :photo_aspect, :intro_text) 
    end

    def photo_all
      @photos = Photo.all
    end

    def photo_with_id
      @photo = Photo.find(params[:id])
    end

end
