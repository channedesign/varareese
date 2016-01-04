class PhotoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	def new
		@photo_cat = PhotoCategory.new
		@photo_cats = PhotoCategory.order("position ASC")
	end

	def create
		@photo_cat = PhotoCategory.new(photo_category_params)
		@photo_cats = PhotoCategory.order("position ASC")
		
		if @photo_cat.save
			redirect_to admins_photo_path, notice: "Photo category created successfully"
		else
			render :new, alert: "Photo category NOT created"
		end
	end

	def edit
		@photo_cats = PhotoCategory.order("position ASC")
		@photo_cat = PhotoCategory.find(params[:id])
	end

	def update
		@photo_cat = PhotoCategory.find(params[:id])

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
			params.require(:photo_category).permit(:name, :position, :image)
		end
end
