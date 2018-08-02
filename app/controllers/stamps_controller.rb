class StampsController < ApplicationController
  def index
    if params['street_address']
      address = ItemGeocoderService.new.user_geocode(params['street_address'])
      @stamps = StampPresenter.new(address).stamps
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @passport = Passport.find_by(user_id: current_user.id)
    @stamp = params['stamp']
  end
end
