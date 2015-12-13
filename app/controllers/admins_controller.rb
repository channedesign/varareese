class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_action :sorted_video, only: [:video]
	before_action :sorted_photo, only: [:photo]


	def index
		
	end

	def video 
		@videos = Video.all
		@video = Video.new
	end

	def photo
		@photos = Photo.all
		@photo = Photo.new
	end

end
