class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.valid?
      @user.save
      session[:user] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end

    def show
      @user = User.find(params[:id])

    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :city, :age, :sex, :orientation, :ethnicity, :height, :physical_shape, :children, :relationship, :education, :image, :bio)
  end

end


#Sign Up (form)
#Validations
# Editing a form
# Loging in , logging out
