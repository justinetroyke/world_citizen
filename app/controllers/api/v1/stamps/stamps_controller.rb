module Api::V1
  class Stamps::StampsController < ::Api::ApiController
    def index
      if params['address']
        address = ItemGeocoderService.new.user_geocode(params['address'])
        @stamps = StampPresenter.new(address).stamps
        render json: @stamps
      else
        render json: Item.all
      end
    end
  end
end
