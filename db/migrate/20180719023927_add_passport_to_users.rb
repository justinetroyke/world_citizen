class AddPassportToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :passport, foreign_key: true
  end
end
