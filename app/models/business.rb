class Business < ApplicationRecord
  validates_presence_of :name,
                        :location

  has_many :items
end
