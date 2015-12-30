class HomeController < ApplicationController
  

  def index
  	@contact_form = ContactForm.new
  	@video_cats = VideoCategory.order("position ASC")
  	@photo_cats = PhotoCategory.order("position ASC")
  end
end
