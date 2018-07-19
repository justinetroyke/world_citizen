class Item < ApplicationRecord
  validates_presence_of :business_name,
                        :name,
                        :donation_amount,
                        :organization,
                        :category,
                        :organization_location
end
