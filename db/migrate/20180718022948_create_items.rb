class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :business_name
      t.string :name
      t.string :donation_amount
      t.string :organization
    end
  end
end
