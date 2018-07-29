class CampaignsController < ApplicationController
  def index
    state = "CA"
    @campaigns = CampaignPresenter.new(state).campaigns
  end
end
