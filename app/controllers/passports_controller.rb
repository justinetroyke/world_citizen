class PassportsController < ApplicationController
  def show
    user = current_user
    @passport = Passport.find(params[:id])
  end

private
  def passport_params
    params.require(:passport).permit(:user_id)
  end
end
