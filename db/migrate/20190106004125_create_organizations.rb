class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
    end
  end
end
