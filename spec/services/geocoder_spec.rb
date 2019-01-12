require "rails_helper"

describe "updates business location to lat/long" do
  it 'it adds lat/long to business' do
    biz = Business.create!(name: "BJ's Restaurant & Brewhouse", location: '10446 Town Center Dr, Westminster, CO 80021')

    GeocoderService.new(biz).update

    expect(biz.longitude).to eq('-105.0742362')
    expect(biz.latitude).to eq('39.8881213')
  end

  it 'it adds lat/long org' do
    org = Organization.create!(name: 'Surfers for Autism', location: '7491 N. Federal Hwy, Boca Raton FL 33487')

    GeocoderService.new(org).update

    expect(org.latitude).to eq('26.4160888')
    expect(org.longitude).to eq('-80.07681490000002')
  end
end
