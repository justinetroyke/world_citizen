class Stamp < ApplicationRecord
  validates_presence_of :name

  has_many :passports, through: :passport_stamps
  has_many :passport_stamps
  has_many :items
end
