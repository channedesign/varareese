class PhotosController < ApplicationController
  before_action :authenticate_admin!
  before_action :photo_with_id, only: [:show, :edit]

  respond_to :json

  def index
    @photos = Photo.order_by_position
    respond_with @photos.to_json(methods: [:image_url]), status: 200
  end

  def show
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
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to "/admins#/photos/#{@photo.id}/edit" }
        format.json { respond_with @photo, status: 200 }
      else
        format.json { respond_with errors: @photo.errors.full_messages, status: 422 }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id]).destroy
    respond_with @photo, status: 200
  end

  def sort
    params[:photo].each_with_index do |id, index|
      Photo.where(id: id).update_all({position: index + 1})
    end
    render nothing: true
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :photo_category_id, :photo, :photo_original_w, :photo_original_h, :photo_box_w, :photo_crop_x, :photo_crop_y, :photo_crop_w, :photo_crop_h, :photo_aspect, :intro_text, :id, :created_at, :updated_at, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :position) 
    end

    def photo_with_id
      @photo = Photo.find(params[:id])
      respond_with @photo.to_json(methods: [:image_url])
    end

end
