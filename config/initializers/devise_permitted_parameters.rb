module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email,   :password, :password_confirmation, :current_password, :firstname, :middlename, :lastname, :nickname) }
  end
end

DeviseController.send :include, DevisePermittedParameters
