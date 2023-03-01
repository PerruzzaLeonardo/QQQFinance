# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   # before_action :configure_sign_in_params, only: [:create]

  def resource
    instance_variable_get(:"@#{resource_name}")
  end 


 
    def resource_name
      devise_mapping.name
    end 


  def create
    self.resource = warden.authenticate!
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_in_params
     #devise_parameter_sanitizer.permit(:sign_in, keys: [])
    #end
end
