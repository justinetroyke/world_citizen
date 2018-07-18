class Item < ApplicationRecord
  validates_presence_of :business_name,
                        :name,
                        :donation_amount,
                        :organization,
                        :category,
                        :stamp

  enum role: {
    local: 0,
    district: 1,
    regional: 2,
    national: 3,
    international: 4,
    world: 5
  }
end
