require "rails_helper"

describe "updates business location to lat/long" do
  it 'it adds business lat/long to item' do
    fb = Category.create!(name: 'F&B')
    item = fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'potion', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Bethesda, MD 20814')

    ItemGeocoderService.new(item).update

    expect(item.business_lng).to eq('-105.0742362')
    expect(item.business_lat).to eq('39.8881213')
    expect(Item.find(item.id).business_lat).to eq('39.8881213')
    expect(Item.find(item.id).business_lng).to eq('-105.0742362')
  end

  it 'it adds org lat/long to item' do
    fb = Category.create!(name: 'F&B')
    item = fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'potion', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Bethesda, MD 20814')

    ItemGeocoderService.new(item).update_org

    expect(item.org_lat).to eq('38.9836694')
    expect(item.org_lng).to eq('-77.0916103')
    expect(Item.find(item.id).org_lat).to eq('38.9836694')
    expect(Item.find(item.id).org_lng).to eq('-77.0916103')
  end
end
