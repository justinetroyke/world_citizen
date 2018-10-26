class Organization < ApplicationRecord
  validates_presence_of :name,
                        :location,
                        :lat,
                        :lng

  has_many :organization_items
  has_many :items, through: :organization_items
end
