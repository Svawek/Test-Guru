class ApplicationController < ActionController::Base

  before_action :before_action_configure_permitted_params, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { lang: I18n.default_locale == I18n.locale ? nil : I18n.locale }
  end

  private

  def before_action_configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up) { |param| param.permit(:name, :last_name, :email, :password, :password_confirmation) }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
