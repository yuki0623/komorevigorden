class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_host!
  before_action :authenticate_cast!
  before_action :authenticate_gest!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
