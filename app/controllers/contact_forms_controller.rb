class ContactFormsController < ApplicationController
  layout "application"

  def new
  	@contact_form = ContactForm.new
  end

  def create
    @videos = Video.all
    @photos = Photo.all
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
