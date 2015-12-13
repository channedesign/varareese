class HomeController < ApplicationController
  before_action :sorted_video, :sorted_photo

  def index
  	@contact_form = ContactForm.new
  end
end
