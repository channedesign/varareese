class HomeController < ApplicationController
  before_action :sorted_photo

  def index
  	@contact_form = ContactForm.new
  	@video_cats = VideoCategory.all
  	@photo_cats = PhotoCategory.all
  end
end
