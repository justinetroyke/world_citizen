require "rails_helper"

describe "returns campaigns for state" do
  it 'should bring back campaign objects' do
    state = "CA"
    results = CampaignPresenter.new(state).campaigns

    expect(results.count).to eq(10)
    campaign = results.last
    expect(campaign.title).to eq("")
    expect(campaign.url).to eq("")
    expect(campaign.stamp).to eq("National")
    expect(campaign.percent_funded).to eq("84%")
  end
end
