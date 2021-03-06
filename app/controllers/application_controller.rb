class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  #Redirects User to #show action (UserProfile) after successful sign in
  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password) }
  end
end
