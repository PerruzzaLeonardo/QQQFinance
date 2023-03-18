# frozen_string_literal: true


 

  class Users::PasswordsController < Devise::PasswordsController
    prepend_before_action :require_no_authentication
    # Render the #edit only if coming from a reset password email link
    append_before_action :assert_reset_token_passed, only: :edit
  
    # GET /resource/password/new
    def new
      @user =User.new
    end
  
    # POST /resource/password
    def create
      @user = User.send_reset_password_instructions(resource_params)
      yield @user if block_given?
  
      if successfully_sent?(@user)
        respond_with({}, location: after_sending_reset_password_instructions_path_for(:user))
      else
        respond_with(@user)
      end
    end
  
    # GET /resource/password/edit?reset_password_token=abcdef
    def edit
      @user =User.new
      set_minimum_password_length
      @user.reset_password_token = params[:reset_password_token]
    end
  

  end 