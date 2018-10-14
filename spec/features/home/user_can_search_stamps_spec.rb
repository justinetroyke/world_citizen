require 'rails_helper'

describe 'returns closest stamps to address of user' do
  context 'As a registered user I fill in address and click search' do
    it 'returns closest stamp items to me' do
      fb = Category.create!(name: 'F&B')
      product = Category.create!(name: 'Product')
      fb.items.create!(business_name: 'Luna Gourmet Coffee & Tea Company', business_location: '7295 Washington St, Denver, CO 80229', name: 'Surfers for Autism Coffee', donation_amount: '$1', organization: 'Surfers for Autism', organization_location: '7491 N. Federal Hwy, Boca Raton FL 33487')
      fb.items.create!(business_name: 'Hedge Row', business_location: '100 Steele St, Denver, CO 80206', name: 'cocktail booklet', donation_amount: 'proceeds', organization: 'The Park People', organization_location: '1510 S. Grant St. Denver, CO 80210')
      product.items.create!(business_name: 'SameDay Office Supply', business_location: '7076 S Alton Way, Centennial, CO 80112', name: 'printer cartridge', donation_amount: 'portion of recycled cartridge', organization: 'Denver Rescue Mission', organization_location: '6100 Smith Road, Denver, CO, 80216')
      fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'portion of the proceeds', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Bethesda, MD 20814')
      product.items.create!(business_name: 'FLEEPS', business_location: '2650 6th Ave, Denver, CO 80204', name: 'shoes', donation_amount: 'a day of school', organization: 'Fleeps Foundation', organization_location: '2650 W 6th Ave, Denver, CO 80204')
      product.items.create!(business_name: 'The Tote Project', business_location: '16161 Ventura Blvd, Encino, CA 91436', name: 'any purchase', donation_amount: '20% of profits', organization: 'Two Wings', organization_location: '3650 W Martin Luther King Jr Blvd, Los Angeles, CA 90008')
      product.items.create!(business_name: 'Marc Skid', business_location: 'Brookhaven, Ga. 31119', name: 'any pair of underwear', donation_amount: '$4', organization: "Purchaser's Pick", organization_location: 'Brookhaven, Ga. 31119')
      product.items.create!(business_name: 'Mable', business_location: '828 Franklin St, San francisco, CA 94102', name: 'toothbrush', donation_amount: '1 toothbrush', organization: "Buy. Give. Teach.", organization_location: '828 Franklin St, San francisco, CA 94102')
      product.items.create!(business_name: '1040.com', business_location: '235 E Palmer St, Franklin, NC 28734', name: 'tax return', donation_amount: '$2', organization: "Healing Water International", organization_location: '15000 W 6th Ave Frontage Rd, Golden, CO 80401')
      product.items.create!(business_name: 'Warby Parker', business_location: '161 6th Ave, New York, NY 10013', name: 'glasses', donation_amount: 'glasses', organization: "VisionSpring", organization_location: '505 8th Avenue, New York, NY 10018')
      product.items.create!(business_name: 'Toms', business_location: '5404 Jandy Pl, Los Angeles, CA 90066', name: 'shoes', donation_amount: 'shoes', organization: "REAP", organization_location: '616 Serra St, Stanford, CA 94305')
      street = '1801 Chestnut Pl'
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
        expect(page).to have_content('5.0 mi')
        # And I should see the business name, category, stamp, item, charity org and distance to item business address for each of the 10 results
      end
    end
  end
end

# I should see a page links to see more results
