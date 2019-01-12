require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:donation_amount) }
  end

  describe 'relationships' do
    it { should belong_to(:category) }
    it { should belong_to(:business) }
    it { should belong_to(:organization) }
  end
end
