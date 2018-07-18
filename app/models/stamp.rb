class Stamp < ApplicationRecord
  validates_presence_of :type

  has_many :passport_stamps
  has_many :items
end
