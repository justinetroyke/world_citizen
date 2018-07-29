class StampDecorator < SimpleDelegator
  attr_reader :user_location,
              :items

  def initialize(user_location)
    @user_location = user_location
    @items = Item.all
  end

  def business_name
  end

  def category
  end

  def stamp
    
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
