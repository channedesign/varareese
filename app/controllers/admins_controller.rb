class AdminsController < ApplicationController

	before_action :authenticate_admin!


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
