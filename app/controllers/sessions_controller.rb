class SessionsController < ApplicationController

  def new
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
      flash[:notice] = "Username or password incorrect"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end

# Need seed db with interests
# User is able to sigh up and create a form (what is checkbox, what is radio?)
# Creating a form, user has to choose several interests (should be checkboxes)
# Validations? (name, age, photo etc are necessary and uniq)
