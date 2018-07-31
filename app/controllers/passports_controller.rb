class PassportsController < ApplicationController
  def show
    @user = current_user
    @passport = Passport.find_by(user_id: current_user.id)
    @stamp = params['stamp']
    @stamps = @passport.passport_stamps
    if @stamp
      stamp_id = Stamp.find_by(name: @stamp).id
      @passport.passport_stamps.create!(stamp_id: stamp_id)
      flash[:success] = "Congratulations! You've earned a #{@stamp} Stamp for your Passport!"
      flash[:notice] = "Great job giving back! In a mood to give more? To directly sponsor a DonorsChoose campaign and collect double the stamps for your passport click #{view_context.link_to 'here', campaigns_path}!".html_safe
    end
  end

private
  def passport_params
    params.require(:passport).permit(:user_id)
  end
end
