class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :business_name
      t.string :name
      t.string :donation_amount
      t.string :organization
      t.string :category

      t.timestamps null: false
    end
  end
end
