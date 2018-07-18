class AddStampToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :stamp, :integer
  end
end
