class HomeController < ApplicationController
  def index
  	@contact_form = ContactForm.new
  	@videos_fashion = Video.where("category like ?", "%fashion%")
    @videos_editorial = Video.where("category like ?", "%editorial%")
    @videos_behind = Video.where("category like ?", "%behind%")
    @videos_week = Video.where("category like ?", "%week%")	
    @videos_short = Video.where("category like ?", "%short%")	
    @photos_head = Photo.where("category like ?", "%head%")
    @photos_event = Photo.where("category like ?", "%event%")
    @photos_recreation = Photo.where("category like ?", "%recreation%")
  end
end
