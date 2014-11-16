class Users::SessionsController < Devise::SessionsController
before_filter :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :email
  end
end
