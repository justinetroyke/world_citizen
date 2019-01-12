class Organization < ApplicationRecord
  before_save :lat_lng

  validates_presence_of :name,
                        :location
  has_many :items

  def self.list_names
    names = []
    Organization.all.each { |org| names << org.name }
    names
  end

  def self.get_id(name)
    Organization.where(name:name).first[:id]
  end

private
  def lat_lng
    GeocoderService.new(self).update
  end
end
