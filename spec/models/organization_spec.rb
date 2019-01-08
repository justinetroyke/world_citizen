require 'rails_helper'

describe Organization, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end

  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe 'methods' do
    it 'it adds organization lat/long' do
      org = Organization.create!(name: 'Cystic Fibrosis Foundation', location: '4550 Montgomery Ave., Bethesda, MD 20814')

      expect(org.longitude).to eq('-77.0916103')
      expect(org.latitude).to eq('38.9836694')
    end

    it 'should return array of all organization names' do
      Organization.create!(name: 'A', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'B', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'C', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'D', location: '10446 Westminster, CO 80021')

      expect(Organization.list_names).to eq(['A', 'B', 'C', 'D'])
    end

    it 'should return the business id' do
      org = Organization.create!(name: 'A', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'B', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'C', location: '10446 Westminster, CO 80021')
      Organization.create!(name: 'D', location: '10446 Westminster, CO 80021')

      expect(Organization.get_id(org.name)).to eq(org.id)
    end
  end
end
