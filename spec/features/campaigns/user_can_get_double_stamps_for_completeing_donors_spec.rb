require 'rails_helper'

describe 'get double stamps for completing donors choose donation' do
  context 'As a registered user' do
    xit 'click on donors choose link and it shows list of campaigns' do
      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      Passport.create(user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # As a register user
      visit campaigns_path
      # I visit 'campaigns#index'
      # I see a list of donor campaigns
      within('.campaigns') do
        expect(page).to have_content("Listening to Woman Holler")
        expect(page).to have_content("National")
        expect(page).to have_content("81%")
        expect(page).to have_link('Completed')
      end

      within(first('.campaigns')) do
        first(:link, "Completed").click
      end

      passport = Passport.find_by(user_id: user.id)

      within("#national") do
        expect(page).to have_content("2/20 stamps")
      end
      # for each campaign there is a title, link url, stamp and percent funded.
      # each result has a completed button
    end
  end
end


# Results can be sorted by stamp level
# when I click completed on a campaign
# Then my current path should be user_passport_path
# and there is a message that states "You have earned to #{level} Stamps for your direct contribution! Thank you for your citizenship!"
