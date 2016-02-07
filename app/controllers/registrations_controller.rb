class RegistrationsController <  Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :address1, :address2, :city, :state, :zipcode, :phone_number) }
  end
  def update_resource(resource, params)
   resource.update_without_password(params)
  end
end
