class UsersController < ApplicationController

  def index
    @users = User.all
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

    #binding.pry
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def matches
    @user = User.find(params[:id])


  end

  private

  def user_params
    # binding.pry
    params.require(:user).permit(:name, :password, :sex, :orientation, :ethnicity, :image, interest_ids: [])
  end

  #:city, :age, :sex, , :height, :physical_shape, :children, :education,:bio
  #i deleted column 'relationship'
end
