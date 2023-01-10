class ApplicationController < ActionController::Base
    before_action :set_currente_user

    def set_currente_user
        if session[:user_id]
            Current.user=User.find_by(id: session[:user_id])
        end
    end
end
