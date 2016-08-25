class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
  def record_not_found(error)
    render json: { errors: [error.message] }, status: :not_found
  end
end