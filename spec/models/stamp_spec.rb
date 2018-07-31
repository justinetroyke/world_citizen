require 'rails_helper'

describe Stamp, name: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:passport_stamps) }
    it { should have_many(:items) }
  end
end
