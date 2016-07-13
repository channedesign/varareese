class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
	end

	# def video 
	# 	@videos = Video.order_by_position
	# 	@video = Video.new
	# 	@video_cats = VideoCategory.order_by_position
	# end

	# def photo
	# 	@photos = Photo.order_by_position
	# 	@photo = Photo.new
	# 	@photo_cats = PhotoCategory.order_by_position
	# end

end
