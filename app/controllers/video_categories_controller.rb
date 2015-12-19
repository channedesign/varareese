class VideoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	def new
		@video_cat = VideoCategory.new
		@video_cats = VideoCategory.all
	end

	def create
		@video_cat = VideoCategory.new(video_category_params)
		@video_cats = VideoCategory.all

		if @video_cat.save
			redirect_to admins_video_path, notice: "Category created successfully"
		else
			render :new, alert: "Category NOT created"
		end
	end

	def destroy
		@video_cat = VideoCategory.find(params[:id]).destroy
		redirect_to admins_video_path, notice: "Category deleted successfully"
	end

	private
		def video_category_params
			params.require(:video_category).permit(:name)
		end
end
