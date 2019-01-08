class Item < ApplicationRecord

  validates_presence_of :name,
                        :donation_amount
  belongs_to :category
  belongs_to :business
  belongs_to :organization
private
  # def format_org_location
  #   self.organization_location = google_address(self.organization_location)
  # end
  #
  # def google_address(location)
  #   location.sub(' ','+').gsub(',','+').sub(' ','+').gsub(' ','')
  # end

  # def lat_lng
  #   ItemGeocoderService.new(self).update
  #   ItemGeocoderService.new(self).update_org
  # end
end
