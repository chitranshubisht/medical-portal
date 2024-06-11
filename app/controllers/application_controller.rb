class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def authorize_receptionist
      redirect_to login_path, alert: "Not authorized" unless current_user&.receptionist?
    end
  
    def authorize_doctor
      redirect_to login_path, alert: "Not authorized" unless current_user&.doctor?
    end
end
  