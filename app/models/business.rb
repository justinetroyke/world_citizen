class Business < ApplicationRecord
  validates_presence_of :name,
                        :location,
                        :lat,
                        :lng

  has_many :business_items
  has_many :items, through: :business_items
end
