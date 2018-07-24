class HomeController < ApplicationController
  def index
    @items = DecorItem.all
  end
end
