class Item < ApplicationRecord
  validates_presence_of :business_name,
                        :name,
                        :donation_amount,
                        :organization,
                        :organization_location,
                        :category_id

  belongs_to :category
end
