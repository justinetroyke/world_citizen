class ItemsController < ApplicationController
  def new
    @item = Item.new
    @bizs = Business.list_names
    @orgs = Organization.list_names
  end

  def create
    category = Category.find_by(params["category"])
    org_id = Organization.get_id(item_params['organization'])
    biz_id = Business.get_id(item_params['business'])
    @item = category.items.create!(name:item_params["name"], donation_amount:item_params["donation_amount"], business_id:biz_id, organization_id:org_id)
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
    params.require(:item).permit(
                                 :business,
                                 :name,
                                 :donation_amount,
                                 :organization,
                                 :category_id)
  end
end
