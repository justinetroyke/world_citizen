require 'rails_helper'

RSpec.describe 'Registered User creates a new item' do
  context 'user registers a new item through new item flow' do
    it 'should create business, org  and item and direct to item show' do
      add = "Add New Item"
      category = Category.create!(name: 'F&B').name
      biz = "Bob's Burgers"
      biz_loc = '10446 Town Center Dr, Westminster, CO 80021'
      name = 'Triple Decker'
      amt = '$10'
      org = 'Less Burgers'
      org_address = '4550 Montgomery Ave., Bethesda, MD 20814'

      user = User.create(name: 'Burt Macklin', email: 'stunna@fbi.com', password: '123abc')
      user.passports.create!

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit stamps_path

      click_on(add)

      expect(current_path).to eq(new_business_path)
      fill_in 'business[name]', with: biz
      fill_in 'business[location]', with: biz_loc
      click_on 'Save New Business'
      # business = Business.last
      # expect(business.name).to eq(biz)
      # expect(business.location).to eq(biz_loc)
      #
      # fill_in 'item[name]', with: name
      # fill_in 'item[donation_amount]', with: amt
      # select(category, from: 'item_category')
      # click_on 'Create New Item'
      # binding.pry
      # item = Item.last
      # expect(item.name).to eq(name)
      # expect(item.donation_amount).to eq(amt)
      #
      # expect(current_path).to eq(new_business_path)

      # expect(updated_item.category.name).to eq(category)
      # expect(updated_item.business_id).to eq(business.id)

      # fill_in 'item[organization]', with: org
      # fill_in 'item[organization_location]', with: org_address
      # expect(page).to have_content(biz)
      # expect(page).to have_content(biz_loc)
      # expect(page).to have_content(name)
      # expect(page).to have_content(amt)
      # expect(page).to have_content(org)
      # expect(page).to have_content(org_address)
      # expect(page).to have_content(category)
    end
  end
end

# <%= f.label :organization %>
# <%= f.text_field :organization %>
#
# <%= f.label :organization_location %>
# <%= f.text_field :organization_location %>

# <%= f.label :business_name %>
# <%= f.text_field :business_name %>
#
# <%= f.label :business_location %>
# <%= f.text_field :business_location %>
