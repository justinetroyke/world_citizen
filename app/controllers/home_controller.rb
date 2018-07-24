class HomeController < ApplicationController
  def index
    user_address = "1801 Chestnut Pl, Denver, CO"
    start = user_address.gsub(',','+').sub(' ','+').gsub(' ','')
    binding.pry
    results = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{start}&destinations=737+Park+street+Piru+CA&key=AIzaSyBViIJ2f4FyRSr
6dWGJXK46UPxsSlrb0pk")
    @items = Item.all
  end
end
