class PhotoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	
	def new
		@photo_cat = PhotoCategory.new
		@photo_cats = PhotoCategory.all
	end

	def create
		@photo_cat = PhotoCategory.new(photo_category_params)
		@photo_cats = PhotoCategory.all
		
		if @photo_cat.save
			redirect_to admins_photo_path, notice: "Photo category created successfully"
		else
			render :new, alert: "Photo category NOT created"
		end
	end

	def destroy
		@photo_cat = PhotoCategory.find(params[:id]).destroy
		redirect_to admins_photo_path, notice: "Photo category deleted successfully"
	end

	private
		def photo_category_params
			params.require(:photo_category).permit(:name)
		end
end
