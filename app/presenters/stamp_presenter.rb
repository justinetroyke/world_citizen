class StampPresenter
  attr_reader :user_location,
              :items

  def initialize(user_location, items)
    @user_location = user_location
    @items = items
  end

  def business_name
  end

  def category
  end

  def stamp
    @items.map do |item|
      response = GoogleDistanceService.new(@user_location, item['organization_location']).get_distance
      org_distance = response.split.first.gsub(',', '').to_i
      if org_distance < 25
        item['stamp_id'] = 0
      else org_distance > 25 & < 50
        item['stamp_id'] = 1
      else org_distance > 50 & < 250
        item['stamp_id'] = 2
      else org_distance > 250 & < 2000
        item['stamp_id'] = 3
      else org_distance > 2000
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

  end
end
