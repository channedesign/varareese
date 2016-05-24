class VideoCategoriesController < ApplicationController
	before_action :authenticate_admin!
	before_action :video_cats_order, except: [:destroy, :update]
	before_action :video_cats_id, only: [:edit, :update]

	respond_to :json

	def index
	end

	def new
		@video_cat = VideoCategory.new
	end

	def create
		@video_cat = VideoCategory.new(video_category_params)

		if @video_cat.save
			redirect_to admins_video_path, notice: "Category created successfully"
		else
			render :new, alert: "Category NOT created"
		end
	end

	def edit
	end

	def update
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

		def video_cats_order
			# @video_cats = VideoCategory.order("position ASC")
			respond_with VideoCategory.order("position ASC")
		end

		def video_cats_id
			@video_cat = VideoCategory.find(params[:id])
		end
end
