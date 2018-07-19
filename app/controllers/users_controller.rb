class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @passport = Passport.create(user_id: @user.id)
    if @user.save
      flash[:success] = "Welcome #{@user.name}!"

      redirect_to user_path(@user.id)
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name,
                                  :email,
                                  :password)
  end
end
