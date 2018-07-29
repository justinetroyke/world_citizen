class StampsController < ApplicationController
  def index
    address = {street: params['street_address'], city: params['city'], state: params['state']}
    @stamps = StampDecorator.new(address)
    # binding.pry
  end
end
