class CreateBusinessItems < ActiveRecord::Migration[5.2]
  def change
    create_table :business_items do |t|
      t.references :item, foreign_key: true
      t.references :business, foreign_key: true
    end
  end
end
