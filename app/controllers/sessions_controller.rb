class SessionsController < ApplicationController

  def new
    #helper method from application_controller.rb that checks if session is present i.e. session[:user_id].present?
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end

  def create
    user = User.find_by(name: params[:name])
    if user.present? && user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:notice] = "Incorrect Username or Password"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
