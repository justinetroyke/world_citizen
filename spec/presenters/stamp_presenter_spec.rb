require "rails_helper"

describe "returns stamps with distance to item and stamp level" do
  it 'return stamp objects' do
    street = '1801 Chestnut Pl'
    city = 'Denver'
    state = 'CO'
    address = {street: street, city: city, state: state}
    fb = Category.create!(name: 'F&B')
    product = Category.create!(name: 'Product')
    items = []
    items << fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, C5-180
    Boca Raton  FL  33487')
    items << fb.items.create!(business_name: 'Hedge Row', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
    items << product.items.create!(business_name: 'SameDay Office Supply', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')

    stamps = StampPresenter.new(address, items).stamps

    expect(stamps.count).to eq(3)

    stamp = stamps.last

    expect(stamp.business_name).to eq('Hedge Row')
    expect(stamp.category).to eq('F&B')
    expect(stamp.stamp).to eq('Local')
    expect(stamp.item).to eq('cocktail booklet')
    expect(stamp.organization).to eq('Surfers for Autism Coffee')
    expect(stamp.item_distance).to eq('4.9mi')
  end
end
