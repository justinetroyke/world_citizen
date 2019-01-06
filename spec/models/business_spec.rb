require 'rails_helper'

describe Business, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end

  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe 'methods' do
    it 'it adds business lat/long' do
      biz = Business.create!(name: "BJ's Restaurant & Brewhouse", location: '10446 Town Center Dr, Westminster, CO 80021')

      expect(biz.longitude).to eq('-105.0742362')
      expect(biz.latitude).to eq('39.8881213')
    end
  end
end
