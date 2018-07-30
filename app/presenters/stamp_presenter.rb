class StampPresenter
  attr_reader :user_location,
              :items

  def initialize(user_location, items)
    @user_location = user_location
    @items = items
  end

  def business_name(item)
    item['business_name']
  end

  def category
  end

  def stamp
    @items.map do |item|
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
  end

  def item
  end

  def organization
  end

  def item_distance
  end

  def stamps
    @items.map do |item|
      item['business_name'] = business_name(item)
      item['category'] = category(item)
    end
  end
end
