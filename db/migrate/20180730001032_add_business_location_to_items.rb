class AddBusinessLocationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :business_location, :string
  end
end
