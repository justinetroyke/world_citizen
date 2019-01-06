class Business < ApplicationRecord
  # before_save :lat_lng

  validates_presence_of :name,
                        :location,
                        :latitude,
                        :longitude
  has_many :items
end
