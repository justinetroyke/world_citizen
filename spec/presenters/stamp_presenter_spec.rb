require "rails_helper"

describe "returns stamps with distance to item and stamp level" do
  it 'return stamp objects' do
    address = {:lat=>"39.7507834", :lng=>"-104.9964355"}
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

    stamps = StampPresenter.new(address).stamps

    expect(stamps.count).to eq(3)

    stamp = stamps.last

    expect(stamp.business_name).to eq(biz3.name)
    expect(stamp.category).to eq('Product')
    expect(stamp.stamp).to eq('Local')
    expect(stamp.item).to eq('printer cartridge')
    expect(stamp.organization).to eq(org3.name)
    expect(stamp.item_distance).to eq('6.1 mi')
  end
end
