class Passport < ApplicationRecord
  belongs_to :user

  has_many :passport_stamps
  has_many :stamps, through: :passport_stamps

  def stamp_amounts(passport)
    if passport.passport_stamps.first.nil?
      zero_amounts
    else
      find_amounts(passport.passport_stamps).first
    end
  end
private

  def find_amounts(stamps)
    amounts = {
          local: 0,
          district: 0,
          regional: 0,
          national: 0,
          international: 0,
        }
    stamps.map do |stamp|
      stamp_object = Stamp.find_by(id: stamp.stamp_id)
      stamp_name = stamp_object.name
      if stamp_name == 'Local'
        amounts[:local] += 1
      elsif stamp_name == 'District'
        amounts[:district] += 1
      elsif stamp_name == 'Regional'
        amounts[:regional] += 1
      elsif stamp_name == 'National'
        amounts[:national] += 1
      elsif stamp_name == 'International'
        amounts[:international] += 1
      end
      amounts
    end
  end

  def zero_amounts
    { local: 0,
      district: 0,
      regional: 0,
      national: 0,
      international: 0,
        }
  end
end
