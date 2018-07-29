require "rails_helper"

describe "returns data from donors choose" do
  it 'it returns response' do
    VCR.use_cassette('services/proposals') do
      state = "CA"
      params = {state: state}
      path = "json_feed.html?&"

      response = DonorsChooseService.new(path, params).campaigns

      expect(response.count).to eq(10)
    end
  end
end
