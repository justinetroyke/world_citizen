class StampPresenter
  attr_reader :user_location,
              :items

  def initialize(user_location)
    @user_location = user_location
    @items = Items.all
  end

  def stamp(item)
    response = GoogleDistanceService.new(@user_location, item['organization_location']).get_distance
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
    GoogleDistanceService.new(@user_location, item['business_location']).get_distance
  end

  def stamps
    @items.map do |item|
      stamp = stamp(item)
      distance = item_distance(item)
      SearchStamp.new(item, stamp, distance)
    end
  end
end
