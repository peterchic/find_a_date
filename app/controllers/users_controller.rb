class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]
  def index
    @users = User.all
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end

  def new
    @user = User.new
    @interests = Interest.all
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      #binding.pry
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    #  binding.pry
      @user = User.find(params[:id])
      @gifs = ["https://media.giphy.com/media/rlkpAmX3gaLWE/giphy.gif", "https://media.giphy.com/media/6iby2g9qPhpVC/giphy.gif", "https://media.giphy.com/media/6iby2g9qPhpVC/giphy.gif", "https://media.giphy.com/media/DdotCCeucTHmU/giphy.gif", "https://media.giphy.com/media/ysMRbIu53piCY/giphy.gif", "https://media.giphy.com/media/10e9zpcP1fty3m/giphy.gif",
      "https://media.giphy.com/media/VEPZELrzlenZu/giphy.gif",
    "https://media.giphy.com/media/12ipPASHq1luj6/giphy.gif", "https://media.giphy.com/media/13CoXDiaCcCoyk/giphy.gif", "https://media.giphy.com/media/1VKi2xud4qsrS/giphy.gif" ]
    #binding.pry
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
    # @search = User.search(params[:search]).all
  end

  private

  def user_params
    # binding.pry
    params.require(:user).permit(:name, :password, :sex, :orientation, :ethnicity, :image, :city, :age, :height, :physical_shape, :children, :education, :bio, interest_ids: [])
  end

  def validate_url_hack
  # Check the params hash to see if the passed :id matches the current user's id
  # (note the .to_i on params[:id], as you are comparing against a Fixnum)
  unless params[:id].to_i == session[:user_id]
    # This line redirects the user to the previous action
    redirect_to users_path
    flash[:message] = "Sorry, you don't have permission to do that."
  end
end

  #:city, :age, :sex, , :height, :physical_shape, :children, :education,:bio
  #i deleted column 'relationship'
end
