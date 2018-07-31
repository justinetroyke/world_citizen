require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:business_name) }
    it { should validate_presence_of(:business_location) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:donation_amount) }
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:organization_location) }
  end

  describe 'relationships' do
    it { should belong_to(:category) }
  end

  xit "can format org location to google api address" do
    new_address = '4550+Montgomery+Ave.+Suite1100N+Bethesda+MD'
    fb = Category.create!(name: 'F&B')
    item = fb.items.create!(business_name: "BJ's Restaurant & Brewhouse", business_location: '10446 Town Center Dr, Westminster, CO 80021', name: 'Pizookie', donation_amount: 'potion', organization: 'Cystic Fibrosis Foundation', organization_location: '4550 Montgomery Ave., Suite 1100 N, Bethesda, MD')

    expect(item.organization_location).to eq(new_address)
  end
end
