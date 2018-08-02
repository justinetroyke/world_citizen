require 'rails_helper'

RSpec.describe 'User visits passport show' do
  it 'should show citizen level' do
    top_message = 'MY JOURNEY TO WORLD CITIZENSHIP'
    user = User.create(name: 'Christian Slater', email: 'broken@arrow.com', password: '123abc')
    passport = Passport.create(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_passport_path(user.id, passport.id)

    expect(page).to have_content(top_message)
    expect(page).to have_content("#{user.name} is currently a citizen in progress!")
    expect(page).to have_content('My Passport')
  end
  it 'should show stamp levels' do
    user = User.create(name: 'Christian Slater', email: 'broken@arrow.com', password: '123abc')
    passport = Passport.create(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_passport_path(user.id, passport.id)

    expect(page).to have_content('Local Citizenship')
    expect(page).to have_content('District Citizenship')
    expect(page).to have_content('Regional Citizenship')
    expect(page).to have_content('National Citizenship')
    expect(page).to have_content('International Citizenship')
    expect(page).to have_content('0/25')
    expect(page).to have_content('0/20')
    expect(page).to have_content('0/15')
  end
end
