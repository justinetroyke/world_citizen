class StampsController < ApplicationController
  def index
    address = {street: params['street_address'], city: params['city'], state: params['state']}
    items = Item.all
    @stamps = StampDecorator.new(address, items)
  end
end
