class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    @business = Business.create!(business_params)
    if @business.save
      flash[:success] = "#{@business.name} has been created!"

      # redirect_to new_organiztion_path
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
