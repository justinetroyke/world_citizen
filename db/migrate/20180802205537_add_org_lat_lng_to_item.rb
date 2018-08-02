class AddOrgLatLngToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :org_lat, :string
    add_column :items, :org_lng, :string
  end
end
