class AddOrganizationLocationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :organization_location, :string
  end
end
