require 'rails_helper'

describe 'rewards stamp to passport when item purchased' do
  context 'As a registered user I complete item purchased' do
    it 'awards a stamp to my passport' do
      fb = Category.create!(name: 'F&B')
      product = Category.create!(name: 'Product')
      biz = Business.create!(name: 'Luna Gourmet Coffee & Tea Company', location: '7295 Washington St, Denver, CO 80229')
      biz3 = Business.create!(name: 'ABC', location: '1510 S. Grant St., Denver, CO 80206')
      org = Organization.create!(name: 'Surfers for Autism', location: '7491 N. Federal Hwy, Boca Raton FL 33487')
      org3 = Organization.create!(name: 'edf', location: '1510 S. Grant St. Denver, CO 80210')
      fb.items.create!(name: 'Surfers for Autism Coffee', donation_amount: '$1', business_id: biz.id, organization_id: org.id)
      item = product.items.create!(name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', business_id: biz3.id, organization_id: org3.id)
      street = '1801 Chestnut Pl'
      city = 'Denver'
      state = "CO"
      message = "Congratulations! You've earned a Local Stamp for your Passport!"
      message2 = "Great job giving back! In a mood to give more? To directly sponsor a DonorsChoose campaign and collect double the stamps for your passport click here!"
      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      passport = user.passports.create!
      Stamp.create!(name: 'Local')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # As a register user
      visit root_path
      # When I visit "/"
       within('.search') do
        fill_in :street_address, with: street
        # And I fill in
        # street address box with "1801 Chestnut Pl"
        fill_in :city, with: city
        # city box with "Denver"
        select(state, from: 'state')
        # state box with "CO"
        click_on 'Search'
      end
      expect(current_path).to eq(stamps_path)

      within('.stamps') do
        click_on('printer cartridge')
      end
      # click on an item
      expect(current_path).to eq("/stamps/#{item.id}")
      # my current path is "item/show"rsp 
      expect(page).to have_content(item.business.name)
      expect(page).to have_content(item.business.location)
      expect(page).to have_content(item.category.name)
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.donation_amount)
      expect(page).to have_content(item.organization.name)
      # I see all the item details
      click_on('Item Purchased')
      # I click on item purchased
      expect(current_path).to eq(user_passport_path(user.id, passport.id))
      # My current path is user_passport_path
      expect(page).to have_content(message)
      # I see a message that says "You've earned #{level} Stamp! Congratulations"
      expect(page).to have_content(message2)
      # I should see a second message that says
      # "Great job giving back! In a mood to give more? Click HERE to collect double the stamps for your passport by directly sponsoring a DonorChose campaign!"
      expect(page).to have_link('here')
      within("#local") do
        expect(page).to have_content("1/25 stamps")
      end
      within("#district") do
        expect(page).to have_content("0/20 stamps")
      end
      within("#regional") do
        expect(page).to have_content("0/15 stamps")
      end
      within("#national") do
        expect(page).to have_content("0/20 stamps")
      end
      within("#international") do
        expect(page).to have_content("0/25 stamps")
      end
    end
  end
end
