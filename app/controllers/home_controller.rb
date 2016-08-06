class HomeController < ApplicationController
  def index
  	@contact_form = ContactForm.new
  	@video_cats = VideoCategory.order_by_position.includes(:videos)
  	@video_show = Video.reel
  	@photo_cats = PhotoCategory.order_by_position.includes(:photos)
  	@photo_show = Photo.reel
  end
end
