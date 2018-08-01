class AddLatLongToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :business_lat, :string
    add_column :items, :business_lng, :string
  end
end
