class BusinessItem < ApplicationRecord
  belongs_to :item
  belongs_to :business
end
