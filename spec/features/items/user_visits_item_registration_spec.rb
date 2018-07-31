require 'rails_helper'

RSpec.describe 'Registered User creates a new item' do
  context 'user registers a new item' do
    it 'should create item and direct to item show' do
      add = "Create New Item"
      category = Category.create!(name: 'F&B').name
      biz = "Bob's Burgers"
      biz_loc = '10446 Town Center Dr, Westminster, CO 80021'
      name = 'Triple Decker'
      amt = '$10'
      org = 'Less Burgers'
      org_address = '4550 Montgomery Ave., Suite 1100 N, Bethesda, MD 20814'

      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      user.passports.create!

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stamps_path

      click_on(add)

      expect(current_path).to eq(new_item_path)

      fill_in 'item[business_name]', with: biz
      fill_in 'item[business_location]', with: biz_loc
      fill_in 'item[name]', with: name
      fill_in 'item[donation_amount]', with: amt
      fill_in 'item[organization]', with: org
      fill_in 'item[organization_location]', with: org_address
      select(category, from: 'item_category')
      click_on 'Create New Item'

      item = Item.last
      expect(current_path).to eq(item_path(item.id))
      expect(page).to have_content(biz)
      expect(page).to have_content(biz_loc)
      expect(page).to have_content(name)
      expect(page).to have_content(amt)
      expect(page).to have_content(org)
      expect(page).to have_content(org_address)
      expect(page).to have_content(category)
    end
  end
end
