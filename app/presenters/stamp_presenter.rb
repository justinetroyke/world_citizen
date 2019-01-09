class StampPresenter
  attr_reader :user_location,
              :items,
              :formatted_user_location

  def initialize(user_location)
    @user_location = user_location
    @items = Item.all
  end

  def stamp(item)
    destination = {lat: item.organization.latitude, lng: item.organization.longitude}
    response = GoogleDistanceService.new(@user_location, destination).get_distance
    org_distance = response.split.first.gsub(',', '').to_i
    if org_distance < 25
      item['stamp_id'] = 0
    elsif (26...50).include? org_distance
      item['stamp_id'] = 1
    elsif (51...250).include? org_distance
      item['stamp_id'] = 2
    elsif (251...2000).include? org_distance
      item['stamp_id'] = 3
    elsif org_distance > 2000
      item['stamp_id'] = 4
    end
  end

  def item_distance(item)
    destination = {lat: item.business.latitude, lng: item.business.longitude}
    GoogleDistanceService.new(@user_location, destination).get_distance
  end

  def stamps
    @items.map do |item|
      stamp = stamp(item)
      distance = item_distance(item)
      SearchStamp.new(item, stamp, distance)
    end
  end
end
