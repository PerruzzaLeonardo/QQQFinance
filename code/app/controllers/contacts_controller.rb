class ContactsController < ApplicationController
    require 'mail_form'
    def new
        @contact = Contact.new
        @utenti=User.all.order(:username)
        @us=[]
    end

    def create
        @contact = Contact.new(params[:contact])
        if @contact.deliver
            redirect_to action: :sent
        else
            flash.now[:error] = 'Could not send message'
            render :new, status: :unprocessable_entity
        end
    end

  def sent

  end

end
