class PhotosController < ApplicationController
  before_action :authenticate_admin!
  def index
    @photos = Photo.all
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
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

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
      params.require(:photo).permit(:name, :photo, {photo_category_ids: []}) 
    end

end
