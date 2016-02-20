class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

rescue_from CanCan::AccessDenied do |exception|
  respond_to do |format|
    format.html { redirect_to new_session_path, alert: exception.message}
  end
end

  def user_signed_in?
    session[:user_id].present?
  end
    helper_method :user_signed_in?



  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
    helper_method :current_user


  def authenticate_user!
    redirect_to new_session_path, notice: "please sign in" unless user_signed_in?
  end
end
