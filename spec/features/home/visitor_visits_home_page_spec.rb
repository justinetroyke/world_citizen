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

    items = create_list(:item, 11)

    visit root_path

    expect(page).to have_content('Business Name')
    expect(page).to have_content('Category')
    expect(page).to have_content('Stamp')
    expect(page).to have_content('Item')
    expect(page).to have_content("Who You're Helping")
    expect(page).to have_content('Distance')
  end

  it 'should show 10 items listed below the fold' do
    items = create_list(:item, 11)

    visit root_path

    items.each do |item|
      expect(page).to have_content(item.business_name)
      expect(page).to have_content(item.category)
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.stamp)
      expect(page).to have_content(item.organization)
      # expect(page).to have_content("distance")
    end
  end
end
