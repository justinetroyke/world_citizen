require 'rails_helper'

describe Organization, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
  end

  describe 'relationships' do
    it { should belong_to(:item) }
  end
end
