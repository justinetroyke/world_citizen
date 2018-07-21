require 'rails_helper'

RSpec.describe 'User visits passport show' do
  it 'should see citizen level' do
    top_message = 'MY JOURNEY TO WORLD CITIZENSHIP'
    user = User.create(name: 'Christian Slater', email: 'broken@arrow.com', password: '123abc')
    passport = Passport.create(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_passport_path(user.id, passport.id)

    expect(page).to have_content(top_message)
    expect(page).to have_content("#{user.name} is currently a citizen in progress!")
    within('#passport') do 
      expect(page).to have_content('My Passport')
    end
  end
end
