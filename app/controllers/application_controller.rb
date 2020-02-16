class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password,:dob,:gender_id,:mobile) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password,:dob,:gender,:mobile) }
        end
end
