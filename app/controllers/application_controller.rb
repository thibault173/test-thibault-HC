class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number biography])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
