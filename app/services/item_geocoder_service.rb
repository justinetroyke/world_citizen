class ItemGeocoderService

  def initialize(item)
    @item = item
  end

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

  def update
    @item.update(business_lat: geocode[:lat], business_lng: geocode[:lng])
  end

  def update_org
    @item.update(org_lat: geocode_org[:lat], org_lng: geocode_org[:lng])
  end
end
