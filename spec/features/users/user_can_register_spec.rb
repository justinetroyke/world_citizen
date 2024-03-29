require 'rails_helper'

RSpec.feature "New account", type: :feature do
  describe 'A visitor' do
    context 'visiting the new account path' do
      it 'should have fields to enter credentials' do

        visit new_user_path

        expect(page).to have_field('user[name]')
        expect(page).to have_field('user[email]')
        expect(page).to have_field('user[password]')
      end
    end

    context 'create account' do
      it 'should redirect to the user profile and show info' do
        name = 'Karen Kilgariff'
        email = 'killgariff@mfm.com'
        password = 'ssdgm'

        visit new_user_path

        fill_in 'user[name]', with: name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password

        click_on 'Create Account'

        expect(current_path).to eq(user_path(User.last.id))
        expect(page).to have_content(name)
        expect(page).to have_content(email)
        expect(page).to have_button('Edit')
        expect(page).to have_link('My Passport')
      end
    end

    context 'account registration creates passport' do
      it 'should show user passport when they click link' do
        top_message = 'MY JOURNEY TO WORLD CITIZENSHIP'
        a_tot = 'Local Citizenship'
        numa = '0/25 stamps'
        b_tot = 'District Citizenship'
        numb = '0/20 stamps'
        c_tot = 'Regional Citizenship'
        numc = '0/15 stamps'
        d_tot = 'National Citizenship'
        numd = '0/20 stamps'
        e_tot = 'International Citizenship'
        nume = '0/25 stamps'
        name = 'Karen Kilgariff'
        email = 'killgariff@mfm.com'
        password = 'ssdgm'

        visit new_user_path

        fill_in 'user[name]', with: name
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        fill_in 'user[password_confirmation]', with: password

        click_on('Create Account')

        expect(current_path).to eq(user_path(User.last.id))

        within('.my_passport') do
          click_on('My Passport')
        end

        expect(page).to have_link('My Passport')
        expect(page).to have_content(top_message)
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
end
