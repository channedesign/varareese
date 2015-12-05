class HomeController < ApplicationController
  def index
  	@contact_form = ContactForm.new
  	@photos = Photo.all
  	@videos = Video.all
  end
end
