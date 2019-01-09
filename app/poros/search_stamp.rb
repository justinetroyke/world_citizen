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

  def id
    @item['id']
  end

  def organization
    @item.organization.name
  end

  def business_name
    @item.business.name
  end

  def category
    @item.category['name']
  end

  def stamp
    if @stamp == 0
      "Local"
    elsif @stamp == 1
      'District'
    elsif @stamp == 2
      'Regional'
    elsif @stamp == 3
      'National'
    elsif @stamp == 4
      'International'
    end
  end

  def item_distance
    @distance
  end
end
