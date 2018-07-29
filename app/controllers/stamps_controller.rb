class StampsController < ApplicationController
  def index
    address = {street: params['street_address'], city: params['city'], state: params['state']}
    binding.pry
  end
end
