class AddItemStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :item_status, :boolean, default: false, null: false
  end
end
