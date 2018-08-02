class ItemGeocoderService

  def initialize(item = {})
    @item = item
  end

  def update
    @item.business_lat = geocode[:lat]
    @item.business_lng = geocode[:lng]
  end

  def update_org
    @item.org_lat = geocode_org[:lat]
    @item.org_lng = geocode_org[:lng]
  end

  def user_geocode(user_address)
    LatLongService.new(user_address).coordinates
  end

private

  def address
    @item.business_location
  end

  def org_address
    @item.organization_location
  end

  def geocode_org
    LatLongService.new(org_address).coordinates
  end

  def geocode
    LatLongService.new(address).coordinates
  end

end
