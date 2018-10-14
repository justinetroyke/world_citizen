class Business < ApplicationRecord

  validates_presence_of :name,
                        :location,
                        :lat,
                        :lng

  has_many :item
end
