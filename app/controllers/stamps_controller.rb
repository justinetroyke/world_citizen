class StampsController < ApplicationController
  def index
    address = {street: params['street_address'], city: params['city'], state: params['state']}
    items = Item.all
    @stamps = StampPresenter.new(address, items).stamps
  end
end
