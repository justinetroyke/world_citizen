class AddStampToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :stamp, foreign_key: true
  end
end
