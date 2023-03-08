class ContactsController < ApplicationController
    require 'mail_form'
    before_action :set_select_collections,only: [:new, :create]

    def new
        @contact = Contact.new
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

  private
  def set_select_collections
    @utenti=User.all.order(:username)
    @us=[]
    @us.push(['-','-'])
    @utenti.each do |utente|
        @us.push([utente.username,utente.username])
  end
end
end
