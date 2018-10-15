class Item < ApplicationRecord
  # before_save :lat_lng

  validates_presence_of :name,
                        :donation_amount,
                        :category_id

  belongs_to :category
  belongs_to :business, optional: true
  belongs_to :organization, optional: true
private
  # def lat_lng
  #   ItemGeocoderService.new(self).update
  #   ItemGeocoderService.new(self).update_org
  # end
end
