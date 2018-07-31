class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    category = Category.find_by(params["category"])
    @item = category.items.create!(item_params)
    if @item.save
      flash[:success] = "#{@item.name} added!"

      redirect_to item_path(@item.id)
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

private
  def item_params
    params.require(:item).permit(:business_name,
                                 :business_location,
                                 :name,
                                 :donation_amount,
                                 :organization,
                                 :organization_location,
                                 :category_id)
  end
end
