class ApplicationController < ActionController::Base

  before_action :before_action_configure_permitted_params, if: :devise_controller?

  private

  def before_action_configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) { |param| param.permit(:name, :email, :password, :password_confirmation) }
  end

end
