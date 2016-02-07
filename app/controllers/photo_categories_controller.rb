class PhotoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	before_action :photo_cats_order, only: [:new, :create, :edit]
	before_action :photo_cats_id, only: [:edit, :update]
	def new
		@photo_cat = PhotoCategory.new
	end

	def create
		@photo_cat = PhotoCategory.new(photo_category_params)
		
		if @photo_cat.save
			redirect_to admins_photo_path, notice: "Photo category created successfully"
		else
			render :new, alert: "Photo category NOT created"
		end
	end

	def edit
	end

	def update

		if @photo_cat.update_attributes(photo_category_params)
			redirect_to new_photo_category_path, notice: "Category edited successfully"
		else
			render :edit, alert: "Category NOT updated"
		end
	end

	def destroy
		@photo_cat = PhotoCategory.find(params[:id]).destroy
		redirect_to admins_photo_path, notice: "Photo category deleted successfully"
	end

	private
		def photo_category_params
			params.require(:photo_category).permit(:name, :position, :image, :image_original_w, :image_original_h, :image_box_w, :image_crop_x, :image_crop_y, :image_crop_w, :image_crop_h, :image_aspect)
		end

		def photo_cats_order 
			@photo_cats = PhotoCategory.order("position ASC")
		end

		def photo_cats_id
			@photo_cat = PhotoCategory.find(params[:id])
		end
end
