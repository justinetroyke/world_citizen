class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}!"

      redirect_to user_path(@user.id)
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_user_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name,
                                  :email,
                                  :password)
  end
end
