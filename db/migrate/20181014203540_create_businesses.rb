class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :lat
      t.string :lng
      t.references :item, foreign_key: true
    end
  end
end