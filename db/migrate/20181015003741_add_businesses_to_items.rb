class AddBusinessesToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :business, foreign_key: true
  end
end
