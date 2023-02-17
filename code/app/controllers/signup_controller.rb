class SignupController < ApplicationController
  #prova per devise
  before_action :authenticate_user!

   
        def index
        end 
    
        def new
        
          @user = User.new
        end
        
        def create
          @user=User.new(user_params)
          respond_to do |format|
            if @user.save
              format.html { redirect_to user_path(@users), notice: "user was successfully created." }
              format.json { render :show, status: :created, location: @user }
            else
              format.html { render :index, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
        end 

        end 

        private 
        def user_params
          if(@user !=nil)
          params.require(:user).permit(:nome, :cognome, :email)
          end 
        end 