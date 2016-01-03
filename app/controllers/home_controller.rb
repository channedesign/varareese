class HomeController < ApplicationController
  

  def index
  	@contact_form = ContactForm.new
  	@video_cats = VideoCategory.order("position ASC")
  	@video_show = Video.where(name: "Reel").first
  	@photo_cats = PhotoCategory.order("position ASC")
  	@photo_show = Photo.where(name: "Reel").first
  end
end
