require 'rails_helper'

RSpec.describe 'User visits item#new' do
  context 'user registers a new item' do
    xit 'should create item and direct to item show' do
      biz = "BJ’s Restaurants"
      name = 'Pizookie'
      amt = '10'
      org = 'Cystic Fibrosis Foundation'
      org_address = '4550 Montgomery Ave., Suite 1100 N, Bethesda, MD 20814'
      category = "F&B"
      # user = User.create!(name: 'Inigo Montoya', email: 'preparetodie@father.com', password: 'killed')

      visit new_item_path

      fill_in 'item[business_name]', with: biz
      fill_in 'item[name]', with: name
      fill_in 'item[donation_amount]', with: amt
      fill_in 'item[organization]', with: org
      fill_in 'item[organization_location]', with: org_address
      select(category, from: 'Category')
      click_on 'Submit'

      expect(current_path).to eq(item_path(Item.last.id))
      expect(page).to have_content(biz)
      expect(page).to have_content(name)
      expect(page).to have_content(amt)
      expect(page).to have_content(org)
      expect(page).to have_content(org_address)
      expect(page).to have_content(category)
    end
  end
end
