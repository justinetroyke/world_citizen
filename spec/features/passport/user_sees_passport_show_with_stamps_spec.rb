require 'rails_helper'

RSpec.describe 'User visits passport show' do
  it 'should see citizen level' do
    top_message = 'MY JOURNEY TO WORLD CITIZENSHIP'
    pass = 'Passport'
    user = User.create!(name: 'Christian Slater', email: 'broken@arrow.com', password: '123abc')
    passport = Passport.create(user_id: user.id)

    visit user_passport_path(user.id)

    expect(page).to have_content(top_message)
    expect(page).to have_content("#{@user.name} is currently a citizen in progress")
    expect(page).to have_content(pass)
  end
end
