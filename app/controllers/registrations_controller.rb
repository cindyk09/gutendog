class RegistrationsController <  Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  protected

  # def after_sign_up_path_for(resource)
  #   user_path(resource)
  # end
  #
  # def after_update_path_for(resource)
  #   user_path(resource)
  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
  end

end
