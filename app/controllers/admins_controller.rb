class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
	end

	def video 
		@videos = Video.order("position ASC")
		@video = Video.new
		@video_cats = VideoCategory.order("position ASC")
	end

	def photo
		@photos = Photo.order("position ASC")
		@photo = Photo.new
		@photo_cats = PhotoCategory.order("position ASC")
	end

end
