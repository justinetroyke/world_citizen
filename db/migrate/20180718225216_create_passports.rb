class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports do |t|
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
