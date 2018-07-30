class SearchStamp
  attr_reader :item,
              :stamp,
              :distance

  def initialize(item, stamp, distance)
    @item = item
    @stamp = stamp
    @distance = distance
  end

  def item
    @item['name']
  end

  def organization
    @item['organization']
  end

  def business_name
    @item['business_name']
  end

  def category
    @item.category['name']
  end

  def stamp
    'Local'
  end

  def item_distance
    @distance
  end
end
