class OrganizationItem < ApplicationRecord
  belongs_to :item
  belongs_to :organization
end
