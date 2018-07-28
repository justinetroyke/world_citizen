require "rails_helper"

describe "returns data from donors choose" do
  it 'it returns response' do
    params = {state: "CA"}
    path = ['json_feed.html']

    response = DonorsChooseService.new(path, params).campaigns

    expect(response.count).to eq(10)
  end
end
