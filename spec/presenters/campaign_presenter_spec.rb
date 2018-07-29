require "rails_helper"

describe "returns campaigns for state" do
  it 'should bring back campaign objects' do
    state = "CA"
    campaigns = CampaignPresenter.new(state).campaigns

    expect(campaigns.count).to eq(10)
    campaign = campaigns.last

    expect(campaign.title).to eq("Going Global With a Read-Aloud With a Positive Message")
    expect(campaign.url).to eq("https://www.donorschoose.org/project/going-global-with-a-read-aloud-with-a-po/3380645/?utm_source=api&utm_medium=feed&utm_content=bodylink&utm_campaign=DONORSCHOOSE")
    expect(campaign.stamp).to eq("National")
    expect(campaign.percent_funded).to eq("82%")
  end
end
