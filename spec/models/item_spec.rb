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
end
