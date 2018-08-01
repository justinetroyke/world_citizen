class ItemGeocoderService

  def initialize(item)
    @item = item
  end

  def address
    @item.business_location
  end

  def geocode
    LatLongService.new(address).coordinates
  end

  def update
    @item.update(business_lat: geocode[:lat], business_lng: geocode[:lng])
  end
end
