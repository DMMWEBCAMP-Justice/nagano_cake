class ChangeItemStatusDefaultOnItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :item_status, from: false, to: true
  end
end
