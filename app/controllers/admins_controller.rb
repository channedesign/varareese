class AdminsController < ApplicationController

	before_action :authenticate_admin!


	def index
		
	end

	def video 
		@videos = Video.all
		@video = Video.new
		@videos_fashion = Video.where("category like ?", "%fashion%")
    	@videos_editorial = Video.where("category like ?", "%editorial%")
    	@videos_behind = Video.where("category like ?", "%behind%")	
    	@videos_week = Video.where("category like ?", "%week%")	
    	@videos_short = Video.where("category like ?", "%short%")	
	end

	def photo
		@photos = Photo.all
		@photo = Photo.new
		@photos_head = Photo.where("category like ?", "%head%")
    	@photos_event = Photo.where("category like ?", "%event%")
    	@photos_recreation = Photo.where("category like ?", "%recreation%")
	end

end
