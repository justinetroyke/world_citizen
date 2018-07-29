require "rails_helper"

describe "returns data from donors choose" do
  xit 'it returns response' do
    state = "CA"
    params = {state: state}
    path = ['json_feed.html']

    response = DonorsChooseService.new(path, params).campaigns

    expect(response.count).to eq(10)
  end
end
