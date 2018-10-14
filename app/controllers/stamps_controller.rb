class StampsController < ApplicationController
  def index
    if address_params
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
private
  def address_params
    params['street_address']
  end

  def address
    ItemGeocoderService.new.user_geocode(address_params)
  end
end
