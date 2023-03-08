# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   # before_action :configure_sign_in_params, only: [:create]

  def resource
    instance_variable_get(:"@#{resource_name}")
  end 


 
    def resource_name
      devise_mapping.name
    end 


  def create #super
    self.resource = warden.authenticate!(auth)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource
  end


    def destroy #super
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      set_flash_message! :notice, :signed_out if signed_out
      yield if block_given?
      respond_to_on_destroy
    end
   
  
  # protected

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_in_params
     #devise_parameter_sanitizer.permit(:sign_in, keys: [])
    #end
end
