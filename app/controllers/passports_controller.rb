class PassportsController < ApplicationController
  def show
    user = User.find(params[:user_id])
    @passport = Passport.find(params[:id])
  end

private
  def passport_params
    params.require(:passport).permit(:user_id)
  end
end
