require 'rails_helper'

RSpec.describe 'Registered User creates a new item' do
  context 'user registers a new item through new item flow' do
    it 'should create business, org  and item and direct to item show' do
      Business.create!(name: 'A', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'A', location: '10446 Westminster, CO 80021')
      Business.create!(name: 'B', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'B', location: '10446 Westminster, CO 80021')
      add = "Add New Item"
      category = Category.create!(name: 'F&B').name
      biz = "Bob's Burgers"
      biz_loc = '10446 Town Center Dr, Westminster, CO 80021'
      biz_lat = '39.8881213'
      biz_lng = '-105.0742362'
      name = 'Triple Decker'
      amt = '$10'
      org = "Le' Charity"
      org_loc = '4550 Montgomery Ave., Bethesda, MD 20814'

      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      user.passports.create!

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stamps_path

      click_on(add)

      expect(current_path).to eq(new_business_path)

      fill_in 'business[name]', with: biz
      fill_in 'business[location]', with: biz_loc
      click_on 'Save New Business'
      business = Business.last
      expect(business.name).to eq(biz)
      expect(business.location).to eq(biz_loc)
      expect(business.latitude).to eq(biz_lat)
      expect(business.longitude).to eq(biz_lng)

      expect(current_path).to eq(new_organization_path)

      fill_in 'organization[name]', with: org
      fill_in 'organization[location]', with: org_loc
      click_on 'Add Organization'
      expect(current_path).to eq(new_item_path)

      fill_in 'item[name]', with: name
      fill_in 'item[donation_amount]', with: amt
      select(category, from: 'item_category')
      select(biz, from: 'item_business')
      select(org, from: 'item_organization')
      click_on 'Create New Item'
      item = Item.last
      expect(item.name).to eq(name)
      expect(item.donation_amount).to eq(amt)
      expect(item.business.name).to eq(biz)
      expect(item.business.location).to eq(biz_loc)
      expect(item.organization.name).to eq(org)
      expect(item.organization.location).to eq(org_loc)

      expect(page).to have_content(biz)
      expect(page).to have_content(biz_loc)
      expect(page).to have_content(name)
      expect(page).to have_content(amt)
      expect(page).to have_content(org)
      expect(page).to have_content(org_loc)
      expect(page).to have_content(category)
    end
  end
end
