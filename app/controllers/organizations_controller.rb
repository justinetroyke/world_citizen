class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create!(organization_params)
    if @organization.save
      flash[:success] = "#{@organization.name} has been added!"

      redirect_to new_item_path
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_organization_path
    end
  end
#
#   def show
#     @organization = Organization.find(params[:id])
#   end
private
  def organization_params
    params.require(:organization).permit(
                                 :name,
                                 :location)
  end
end
