class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  protected

  def render_not_found
    render json: { message: "Resource not found" }, status: :not_found
  end

  def render_invalid(exception)
    render json: { errors: exception.errors }, status: 422
  end
end
