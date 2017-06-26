class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]
  def index
    @search = User.search(params[:q])
    @users = @search.result.uniq
    @interests = Interest.all
    if(logged_in?)
      @user = User.find(session[:user_id])
    end
  end

  def new
    @user = User.new
    @interests = Interest.all
  end

  def create
    @user = User.new(user_params)
    if(@user.image.empty?)
      @user.image = "https://cdn1.iconfinder.com/data/icons/ninja-things-1/1772/ninja-simple-512.png"
    end
    if(@user.valid?)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Incorrect info"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @gifs = ["https://media.giphy.com/media/rlkpAmX3gaLWE/giphy.gif", "https://media.giphy.com/media/6iby2g9qPhpVC/giphy.gif", "https://media.giphy.com/media/6iby2g9qPhpVC/giphy.gif", "https://media.giphy.com/media/DdotCCeucTHmU/giphy.gif", "https://media.giphy.com/media/ysMRbIu53piCY/giphy.gif", "https://media.giphy.com/media/10e9zpcP1fty3m/giphy.gif",
    "https://media.giphy.com/media/VEPZELrzlenZu/giphy.gif", "https://media.giphy.com/media/13CoXDiaCcCoyk/giphy.gif", "https://media.giphy.com/media/1VKi2xud4qsrS/giphy.gif", ]
  end

  def edit
    @user = User.find(params[:id])
    validate_url_hack
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    User.find(params[:id]).destroy
    session.clear
    redirect_to "/"
  end

  def matches
    @user = User.find(params[:id])
  end

  def search
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :sex, :orientation, :ethnicity, :image, :city, :age, :height, :physical_shape, :children, :education, :bio, interest_ids: [])
  end

  def validate_url_hack
    unless params[:id].to_i == session[:user_id]
    redirect_to users_path
    flash[:message] = "Sorry, you don't have permission to do that."
    end
  end

  def password_match
    params[:password] == params[:password_confirmation]
  end
end
