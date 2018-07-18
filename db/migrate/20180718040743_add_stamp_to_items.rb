class AddStampToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stamp, :integer, default: 0
  end
end
