class Item < ApplicationRecord
  validates_presence_of :business_name,
                        :name,
                        :donation_amount,
                        :organization,
                        :category,
                        :organization_location
                        :stamp

  enum stamp: [
    :local,
    :district,
    :regional,
    :national,
    :international,
    :world
  ]
end
