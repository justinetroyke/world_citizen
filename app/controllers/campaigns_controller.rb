class CampaignsController < ApplicationController
  def index
    response = Faraday.get("https://api.donorschoose.org/common/json_feed.html?state=CA&APIKey=DONORSCHOOSE")
    results = JSON.parse(response.body)
    prop = results["proposals"].first
    @campaigns = Campaign.new(prop)
    binding.pry
  end
end
