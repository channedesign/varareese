class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_action :sorted_photo, only: [:photo]


	def index
		
	end

	def video 
		@videos = Video.all
		@video = Video.new
		@video_cats = VideoCategory.all
	end

	def photo
		@photos = Photo.all
		@photo = Photo.new
		@photo_cats = PhotoCategory.all
	end

end
