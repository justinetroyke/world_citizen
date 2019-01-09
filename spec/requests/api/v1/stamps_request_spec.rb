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
    biz = Business.create!(name: 'Luna Gourmet Coffee & Tea Company', location: '7295 Washington St, Denver, CO 80229')
    biz2 = Business.create!(name: 'Hedge Row', location: '100 Steele St, Denver, CO 80206')
    biz3 = Business.create!(name: 'ABC', location: '1510 S. Grant St., Denver, CO 80206')
    org = Organization.create!(name: 'Surfers for Autism', location: '7491 N. Federal Hwy, Boca Raton FL 33487')
    org2 = Organization.create!(name: 'The Park People', location: '1510 S. Grant St. Denver, CO 80210')
    org3 = Organization.create!(name: 'edf', location: '1510 S. Grant St. Denver, CO 80210')
    fb.items.create!(name: 'Surfers for Autism Coffee', donation_amount: '$1', business_id: biz.id, organization_id: org.id)
    fb.items.create!(name: 'cocktail booklet', donation_amount: 'proceeds', business_id: biz2.id, organization_id: org2.id)
    product.items.create!(name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', business_id: biz3.id, organization_id: org3.id)
    params = "1801 Chestnut Pl, Denver, CO"

    get "/api/v1/stamps/all?address=#{params}"

    expect(response).to be_successful
    stamps = JSON.parse(response.body)

    expect(stamps.count).to eq(3)
  end
end
