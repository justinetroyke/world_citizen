require 'rails_helper'

describe "Stamps API" do
  it "returns stamps based on users address" do
    Stamp.create!(name: 'Local')
    Stamp.create!(name: 'District')
    Stamp.create!(name: 'Regional')
    Stamp.create!(name: 'National')
    Stamp.create!(name: 'International')
    fb = Category.create!(name: 'F&B')
    product = Category.create!(name: 'Product')
    fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'portion of the proceeds', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Bethesda, MD 20814')
    product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
    product.items.create!(business_name: 'KITTLE REAL ESTATE', business_location: '300 S Howes St, Fort Collins, CO 80521', name: 'real estate', donation_amount: '$9,000.00', organization: 'Sell a Home, Save a Child', organization_location: '300 S Howes St, Fort Collins, CO 80521')
    params = "1801 Chestnut Pl, Denver, CO 80202"

    get "/api/v1/stamps/all?address=#{params}"

    expect(response).to be_successful
    stamps = JSON.parse(response.body)

    expect(stamps.count).to eq(3)
  end
end
