require 'rails_helper'

RSpec.describe 'Visitor visits home#index' do
  # it 'should have a registration link' do
  #   reg = "Register"
  #   log = "Log In"
  #   stamp = "Stamps"
  #   reg2 = "Item Registration"
  #
  #   visit root_path
  #
  #   expect(page).to have_content(reg)
  #   expect(page).to have_content(log)
  #   expect(page).to have_content(stamp)
  #   expect(page).to have_content(reg2)
  # end

  it 'should show app name, description and info sections above the fold' do
    wc = "World Citizen"
    tagline = "A way to give back to the world through the purchases you already make"
    info1 = "How you're helping"
    info2 = "How to play"

    visit root_path

    expect(page).to have_content(wc)
    expect(page).to have_content(tagline)
    expect(page).to have_content(info1)
    expect(page).to have_content(info2)
  end

  it 'should show item attributes as headers below the fold' do
    visit root_path

    expect(page).to have_content('Business Name')
    expect(page).to have_content('Category')
    expect(page).to have_content('Stamp')
    expect(page).to have_content('Item')
    expect(page).to have_content("Who You're Helping")
    expect(page).to have_content('Distance')
  end

  it 'should show local items in relation to the user address' do
    fb = Category.create!(name: 'F&B')
    product = Category.create!(name: 'Product')
    # item_1 = fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", name: 'Pizookie', donation_amount: 'potion', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Suite 1100 N, Bethesda, MD 20814')
    item_2 = fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', name: 'Brew of Bravery Coffee', donation_amount: '2 bags of coffee', organization: 'USO', organization_location: '8400 Peña Blvd unit 492093, Denver, CO 802494')
    item_3 = product.items.create!(business_name: 'SameDay Office Supply', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')

    visit root_path
# binding.pry

    expect(page).to have_content(item_2.business_name)
    # expect(page).to have_content(item_3.business_name)
    # expect(page).to_not have_content(item_1.business_name)
    expect(page).to have_content(item_2.category.name)
    # expect(page).to have_content(item_3.category)
    # expect(page).to_not have_content(item_1.category)
    expect(page).to have_content('Local')
    expect(page).to have_content(item_2.name)
    # expect(page).to have_content(item_3.name)
    # expect(page).to_not have_content(item_1.name)
    expect(page).to have_content(item_2.organization)
    # expect(page).to have_content(item_3.organization)
    # expect(page).to_not have_content(item_1.organization)
    expect(page).to have_content('27.7 mi')
    # expect(page).to have_content('6.2 mi')
  end

  xit 'should show 10 items listed below the fold' do
    #fix factory bot to create list with cartegory_id

    visit root_path

    items.each do |item|
      expect(page).to have_content(item.business_name)
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.organization)
    end
  end
end
