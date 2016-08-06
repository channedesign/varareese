class ContactFormsController < ApplicationController
 
  def new
  	@contact_form = ContactForm.new
  end

  def create
  	@contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash[:success] = 'Thank you for your message. Vara will contact you soon!'
      redirect_to :root
    else
      flash.now[:danger] = 'Cannot send message.'
      render "home/index"
    end
  end
end
