class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if user_signed_in?
      session[:user][:email]
    end
    nil
  end

  def user_signed_in?
    session[:user].present? && session[:user]["email"].present?
  end

  helper_method :current_user
  helper_method :user_signed_in?

end
