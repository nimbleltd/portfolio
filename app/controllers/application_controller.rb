class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller? 


  def configure_permitted_parametere


    devise_paramter_sanitizer.permit(:sign_up, keys: [:name])
    devise_paramter_sanitizer.permit(:account_update, keys: [:name])

  end
end
