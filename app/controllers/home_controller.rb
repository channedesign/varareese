class HomeController < ApplicationController
  before_action :sorted_photo

  def index
  	@contact_form = ContactForm.new
  	@video_cats = VideoCategory.order("position ASC")
  	@photo_cats = PhotoCategory.all
  end
end
