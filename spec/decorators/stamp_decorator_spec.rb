require "rails_helper"

describe "returns stamps with for state" do
  it 'should bring back campaign objects' do
    state = "CA"
    campaigns = CampaignPresenter.new(state).campaigns
    expect(campaigns.count).to eq(10)
    campaign = campaigns.last
    expect(campaign.title).to eq("Kinder Wiggles While Working")
    expect(campaign.url).to eq("https://www.donorschoose.org/project/kinder-wiggles-while-working/3179273/?utm_source=api&utm_medium=feed&utm_content=bodylink&utm_campaign=DONORSCHOOSE")
    expect(campaign.stamp).to eq("National")
    expect(campaign.percent_funded).to eq("84%")
  end
end
