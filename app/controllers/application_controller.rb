class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def main #root page
    if logged_in?
      @user = User.find(session[:user_id])
      redirect_to users_path
    end
  end

  private
  def authorize
    unless logged_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
