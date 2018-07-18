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
  end
end
