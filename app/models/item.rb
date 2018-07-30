class Item < ApplicationRecord
  before_save :format_org_location

  validates_presence_of :business_name,
                        :business_location,
                        :name,
                        :donation_amount,
                        :organization,
                        :organization_location,
                        :category_id

  belongs_to :category
private
  def format_org_location
    self.organization_location = google_address(self.organization_location)
  end

  def google_address(location)
    location.sub(' ','+').gsub(',','+').sub(' ','+').gsub(' ','')
  end
end
