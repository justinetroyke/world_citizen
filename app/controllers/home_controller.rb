class HomeController < ApplicationController
  def index
    @items = Item.all
    user_address = "1801 Chestnut Pl, Denver, CO"
    start = user_address.sub(' ','+').gsub(',','+').sub(' ','+').gsub(' ','')
    results = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=1801+Chestnut+Place+Denver+CO&destinations=737+Park+street+Piru+CA&key=AIzaSyBViIJ2f4FyRSr6dWGJXK46UPxsSlrb0pk")
binding.pry
  end
end
