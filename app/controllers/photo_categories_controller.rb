class PhotoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	before_action :photo_cats_id, only: [:edit, :update, :destroy]
	
	respond_to :json

	def index
		@photo_cats = PhotoCategory.order_by_position
		respond_with @photo_cats.to_json(methods: [:image_url]), status: 200
	end

	def new
	end

	def create
		@photo_cat = PhotoCategory.new(photo_category_params)

		if @photo_cat.save
			respond_with @photo_cat, status: 200
		else
			respond_with json: {errors: @photo_cat.errors.full_messages.join(',')}, status: 422
		end
	end

	def edit
	end

	def update
  	respond_to do |format|
	  	if @photo_cat.update_attributes(photo_category_params)
	  		format.html { redirect_to '/admins#/photos' }
	  		format.json { 
	  									respond_with @photo_cat.to_json(methods: [:image_url]), 
	  									json: {message: "success", url: @photo_cat.image_url, id: @photo_cat.id, status: 200} 
	  								}
	  	else
	  		format.json { respond_with errors: @photo_cat.errors.full_messages, status: 422 }
	  	end
	  end
	end

	def destroy
		respond_with @photo_cat.destroy, status: 200
	end

	def sort
    params[:photo_category].each_with_index do |id, index|
      PhotoCategory.where(id: id).update_all({position: index + 1})
    end
    render nothing: true
  end

	private
		def photo_category_params
			params.require(:photo_category).permit(:name, :position, :image, :image_original_w, :image_original_h, :image_box_w, :image_crop_x, :image_crop_y, :image_crop_w, :image_crop_h, :image_aspect, :id)
		end

		def photo_cats_id
			@photo_cat = PhotoCategory.find(params[:id])
		end
end
