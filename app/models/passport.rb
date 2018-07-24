class Passport < ApplicationRecord
  belongs_to :user
  
  has_many :passport_stamps
  has_many :stamps, through: :passport_stamps
end
