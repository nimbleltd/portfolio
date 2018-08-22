module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters, if: :devise_controller? 
  end

  def configure_permitted_parameters
    devise_paramter_sanitizer.permit(:sign_up, keys: [:name])
    devise_paramter_sanitizer.permit(:account_update, keys: [:name])
  end

end