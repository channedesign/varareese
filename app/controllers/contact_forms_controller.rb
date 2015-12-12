class ContactFormsController < ApplicationController
  

  def new
  	@contact_form = ContactForm.new
  end

  def create
    @videos_fashion = Video.where("category like ?", "%fashion%")
    @videos_editorial = Video.where("category like ?", "%editorial%")
    @videos_behind = Video.where("category like ?", "%behind%")
    @videos_week = Video.where("category like ?", "%week%") 
    @videos_short = Video.where("category like ?", "%short%") 
    @photos_head = Photo.where("category like ?", "%head%")
    @photos_event = Photo.where("category like ?", "%event%")
    @photos_recreation = Photo.where("category like ?", "%recreation%")
  	begin
  	@contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash[:success] = 'Thank you for your message. Vara will contact you soon!'
      redirect_to :root
    else
      flash.now[:danger] = 'Cannot send message.'
      render "home/index"
    end
    rescue ScriptError
        flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
