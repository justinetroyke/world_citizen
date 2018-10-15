class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    id = Item.last.id
    item = Item.find_by(id: id)
    @business = Business.create!(business_params)
    if @business.save
      item[:business_id] = @business.id
      flash[:success] = "#{@business.name} has been added to #{item.name}!"
      
      redirect_to new_item_path
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_business_path
    end
  end

  def show
    @business = Business.find(params[:id])
  end

private
  def business_params
    params.require(:business).permit(:name,
                                 :location,
                                 :item_id)
  end
end
