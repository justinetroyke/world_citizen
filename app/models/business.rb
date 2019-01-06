class Business < ApplicationRecord
  before_save :lat_lng

  validates_presence_of :name,
                        :location
  has_many :items
private
  def lat_lng
    ItemGeocoderService.new(self).update
  end
end
