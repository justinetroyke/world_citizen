class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
