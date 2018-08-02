require "rails_helper"

describe "returns stamps with distance to item and stamp level" do
  it 'return stamp objects' do
    street = '1801 Chestnut Pl'
    city = 'Denver'
    state = 'CO'
    address = {street: street, city: city, state: state}
    fb = Category.create!(name: 'F&B')
    product = Category.create!(name: 'Product')
    fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, Boca Raton FL 33487')
    fb.items.create!(business_name: 'Hedge Row', business_location: '100 Steele St, Denver, CO 80206', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
    product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')

    stamps = StampPresenter.new(address).stamps

    expect(stamps.count).to eq(3)

    stamp = stamps.last

    expect(stamp.business_name).to eq('SameDay Office Supply')
    expect(stamp.category).to eq('Product')
    expect(stamp.stamp).to eq('Local')
    expect(stamp.item).to eq('printer cartridge')
    expect(stamp.organization).to eq('Denver Rescue Mission')
    expect(stamp.item_distance).to eq('16.1 mi')
  end
end
