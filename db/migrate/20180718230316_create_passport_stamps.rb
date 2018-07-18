class CreatePassportStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :passport_stamps do |t|
      t.references :passport, foreign_key: true
      t.references :stamp, foreign_key: true
    end
  end
end
