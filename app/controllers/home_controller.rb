class HomeController < ApplicationController
  def index
  	@contact_form = ContactForm.new
  	@videos = Video.all
  	@video_cats = VideoCategory.order_by_position
  	@video_show = Video.reel
  	@photo_cats = PhotoCategory.order_by_position
  	@photo_show = Photo.reel
  end
end
