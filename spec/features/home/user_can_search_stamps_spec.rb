require 'rails_helper'

describe 'returns 10 closest stamps to address of user' do
  context 'As a registered user I fill in address and click search' do
    it 'returns 10 closest stamp items to me' do
      VCR.use_cassette("features/donors_choose") do
        street = '1801 Chestnut Pl'
        city = 'Denver'
        state = "CO"
        user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
        Passport.create(user_id: user.id)

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
        expect(page).to have_selector('.stamps', count: 10)
        within('.stamps') do
          expect(item).to have_content('Hedge Row')
          expect(item).to have_content('F&B')
          expect(item).to have_content('Local')
          expect(item).to have_content('cocktail booklet')
          expect(item).to have_content('Surfers for Autism Coffee')
          expect(item).to have_content('4.9 mi')
        end
      end
    end
  end
end


# And I should see the business name, category, stamp, item, charity org and distance to item business address for each of the 10 results
# I should see a link to see more results