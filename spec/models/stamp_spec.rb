require 'rails_helper'

describe Stamp, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:type) }
  end

  describe 'relationships' do
    it { should have_many(:passport_stamps) }
    it { should have_many(:items) }
  end
end
