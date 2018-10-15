class Organization < ApplicationRecord
  validates_presence_of :name,
                        :location,
                        :lat,
                        :lng

  belongs_to :item
end
