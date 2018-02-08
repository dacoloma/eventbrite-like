class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bienvenido !"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    current_user
  end

  def update
    current_user
    if current_user.update(user_params)
      flash[:success] = "Edit with success !"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show
    current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
