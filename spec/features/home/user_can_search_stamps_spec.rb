require 'rails_helper'

describe 'returns closest stamps to address of user' do
  context 'As a registered user I fill in address and click search' do
    it 'returns closest stamp items to me' do
      fb = Category.create!(name: 'F&B')
      product = Category.create!(name: 'Product')
      fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, Boca Raton FL 33487')
      fb.items.create!(business_name: 'Hedge Row', business_location: '100 Steele St, Denver, CO 80206', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
      product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
      street = '1331 17th St'
      city = 'Denver'
      state = "CO"
      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      user.passports.create!

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
        # and click "search"
      end
      expect(current_path).to eq(stamps_path)
      # Then my current path should be "/"
      # And I should see the 10 items with the closest business address to the submitted address
      within('.stamps') do
        expect(page).to have_content('Luna Gourmet Coffee & Tea Company')
        expect(page).to have_content('F&B')
        expect(page).to have_content('Local')
        expect(page).to have_content('Surfers for Autism Coffee')
        expect(page).to have_content('Surfers for Autism')
        expect(page).to have_content('4.9 mi')
        # And I should see the business name, category, stamp, item, charity org and distance to item business address for each of the 10 results
      end
    end
  end
end

# I should see a page links to see more results
