class CampaignsController < ApplicationController
  def index
    @campaigns = CampaignPresenter.new(state).campaigns
  end
end
