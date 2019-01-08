class Business < ApplicationRecord
  before_save :lat_lng
  validates_presence_of :name,
                        :location
  has_many :items

  def self.list_names
    names = []
    Business.all.each { |biz| names << biz.name }
    names
  end

  def self.get_id(name)
    Business.where(name:name).first[:id]
  end

private
  def lat_lng
    ItemGeocoderService.new(self).update
  end
end
