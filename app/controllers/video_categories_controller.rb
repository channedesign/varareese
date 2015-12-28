class VideoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	def new
		@video_cat = VideoCategory.new
		@video_cats = VideoCategory.order("position ASC")
	end

	def create
		@video_cat = VideoCategory.new(video_category_params)
		@video_cats = VideoCategory.order("position ASC")

		if @video_cat.save
			redirect_to admins_video_path, notice: "Category created successfully"
		else
			render :new, alert: "Category NOT created"
		end
	end

	def edit
		@video_cats = VideoCategory.order("position ASC")
		@video_cat = VideoCategory.find(params[:id])
	end

	def update
		@video_cat = VideoCategory.find(params[:id])

		if @video_cat.update_attributes(video_category_params)
			redirect_to new_video_category_path, notice: "Category edited successfully"
		else
			render :edit, alert: "Category NOT updated"
		end
	end

	def destroy
		@video_cat = VideoCategory.find(params[:id]).destroy
		redirect_to admins_video_path, notice: "Category deleted successfully"
	end

	private
		def video_category_params
			params.require(:video_category).permit(:name, :position, :image)
		end
end
