class StampsController < ApplicationController
  def index
    address = "#{params['street_address'].gsub(' ','+')}+#{params['city']}+#{params['state']}"
    items = Item.all
    @stamps = StampPresenter.new(address, items).stamps
  end
end
