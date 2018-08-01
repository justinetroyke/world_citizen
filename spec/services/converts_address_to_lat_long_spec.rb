require "rails_helper"

describe "returns lat/long for an address" do
  it 'it returns coordinates' do
    business_location = "10446 Town Center Dr, Westminster, CO 80021"

    response = LatLongService.new(business_location).coordinates

    expect(response).to eq({lat: 39.8881213, lng: -105.0742362})
  end
end
