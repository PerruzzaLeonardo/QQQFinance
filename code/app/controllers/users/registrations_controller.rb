# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_permitted_parameters, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
 
    #prova per devise
    #before_action :authenticate_user!
  
     
          def index
          end 
      
          def new
          
            @user = User.new
          end
          
          def create
            @user=User.new(sign_up_params)
            respond_to do |format|
              if @user.save
                format.html { redirect_to '/login'}
                
               
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
            end
          end 
  
           
  
          private 
          def sign_up_params
            
            params.require(resource_name).permit([:nome,:cognome,:email,:password]) #da completare
           
       
        end 
      
         # protected
          def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:cognome,:nome])
          end
       
 

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
     #'login'
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
