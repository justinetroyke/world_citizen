module Api::V1
  class Stamps::StampsController < ::Api::ApiController
    def index
      if address_params
        @stamps = StampPresenter.new(address).stamps
        render json: @stamps
      else
        render json: Item.all
      end
    end

private
    def address_params
      params['street_address']
    end

    def address
      ItemGeocoderService.new.user_geocode(address_params)
    end
  end
end
