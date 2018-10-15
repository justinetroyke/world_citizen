class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :lat
      t.string :lng
    end
  end
end
