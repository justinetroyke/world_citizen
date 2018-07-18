require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:business_name) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:donation_amount) }
    it { should validate_presence_of(:organization) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:stamp) }
  end
end
