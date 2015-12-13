class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  	def sorted_video
  		@videos_fashion = Video.where("category like ?", "%fashion%")
	    @videos_editorial = Video.where("category like ?", "%editorial%")
	    @videos_behind = Video.where("category like ?", "%behind%")
	    @videos_week = Video.where("category like ?", "%week%") 
	    @videos_short = Video.where("category like ?", "%short%") 
  	end
  	def sorted_photo
	    @photos_head = Photo.where("category like ?", "%head%")
	    @photos_event = Photo.where("category like ?", "%event%")
	    @photos_recreation = Photo.where("category like ?", "%recreation%")
  	end

end
