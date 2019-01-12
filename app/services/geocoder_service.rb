class GeocoderService

  def initialize(item = {})
    @item = item
  end

  def update
    @item.latitude = geocode[:lat]
    @item.longitude = geocode[:lng]
  end

  def user_geocode(user_address)
    coordinates = LatLongService.new(user_address).coordinates
    lat = coordinates[:lat].to_s
    lng = coordinates[:lng].to_s
    {:lat=> lat, :lng=> lng}
  end

private

  def address
    @item.location
  end

  def geocode
    LatLongService.new(address).coordinates
  end
end
