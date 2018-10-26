class CreateOrganizationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_items do |t|
      t.references :item, foreign_key: true
      t.references :organization, foreign_key: true
    end
  end
end
