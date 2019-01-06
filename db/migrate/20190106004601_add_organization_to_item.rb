class AddOrganizationToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :organization, foreign_key: true
  end
end
