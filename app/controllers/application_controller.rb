class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :role, :password, :manager_id) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :role, :password, :current_password, :manager_id)}
  end
end
