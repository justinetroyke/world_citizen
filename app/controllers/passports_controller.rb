class PassportsController < ApplicationController
  def show
    @user = current_user
    # @passport = Passport.find(params[:id])
    # redirect_to user_passport_path(user.id, passport.id)
  end

private
  def passport_params
    params.require(:passport).permit(:user_id)
  end
end
