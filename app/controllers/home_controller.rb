class HomeController < ApplicationController
  def index
    @items = Item.all
    user_address = "1801 Chestnut Pl, Denver, CO"
    start = user_address.sub(' ','+').gsub(',','+').sub(' ','+').gsub(' ','')
    destination = @items.first.organization_location

    body = JSON.parse(response.body)
    @distance = body['rows'].first['elements'].first['distance']['text']
  end
end
