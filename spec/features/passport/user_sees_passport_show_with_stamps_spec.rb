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
    within('#passport') do
      expect(page).to have_content('My Passport')
    end
  end

  it 'should show stamp levels' do
    a = 'Local Stamps:'
    a_tot = 'Local Citizenship'
    numa = '0/25'
    b = 'District Stamps:'
    b_tot = 'District Citizenship'
    numb = '0/20'
    c = 'Regional Stamps:'
    c_tot = 'Regional Citizenship'
    numc = '0/15'
    d = 'National Stamps:'
    d_tot = 'National Citizenship'
    numd = '0/20'
    e = 'International Stamps:'
    e_tot = 'International Citizenship'
    nume = '0/25'

    user = User.create(name: 'Christian Slater', email: 'broken@arrow.com', password: '123abc')
    passport = Passport.create(user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_passport_path(user.id, passport.id)

    within('#passport') do
      expect(page).to have_content(a)
      expect(page).to have_content(b)
      expect(page).to have_content(c)
      expect(page).to have_content(d)
      expect(page).to have_content(e)
      expect(page).to have_content(numa)
      expect(page).to have_content(numb)
      expect(page).to have_content(numc)
      expect(page).to have_content(numd)
      expect(page).to have_content(nume)
      expect(page).to have_content(a_tot)
      expect(page).to have_content(b_tot)
      expect(page).to have_content(c_tot)
      expect(page).to have_content(d_tot)
      expect(page).to have_content(e_tot)
    end
  end
end
