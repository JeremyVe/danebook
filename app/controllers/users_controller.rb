class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "User Created"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong"
      render :new
    end
  end

  private

  def whitelisted_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
