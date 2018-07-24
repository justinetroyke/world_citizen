require 'rails_helper'

describe Passport, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:passport_stamps) }
  end
end
