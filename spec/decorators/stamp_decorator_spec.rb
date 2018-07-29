require "rails_helper"

describe "returns stamps with distance to item and stamp level" do
  it 'return stamp objects' do
    street = '1801 Chestnut Pl'
    city = 'Denver'
    state = 'CO'
    address = {street: street, city: city, state: state}
    stamps = StampDecorator.new(address).stamps
    expect(stamps.count).to eq(10)
    stamp = stamps.last
    expect(stamp.business_name).to eq('Hedge Row')
    expect(stamp.category).to eq('F&B')
    expect(stamp.stamp).to eq('Local')
    expect(stamp.item).to eq('cocktail booklet')
    expect(stamp.organization).to eq('Surfers for Autism Coffee')
    expect(stamp.item_distance).to eq('4.9mi')
  end
end
