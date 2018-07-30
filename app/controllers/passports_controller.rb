class PassportsController < ApplicationController
  def show
    @user = current_user
    @passport = Passport.find_by(user_id: current_user.id)
    @stamp = params['local']
    if @stamp?
      flash[:notice] = "Congratulations! You've earned a #{@stamp} Stamp for your Passport!"
    end
  end

private
  def passport_params
    params.require(:passport).permit(:user_id)
  end
end
