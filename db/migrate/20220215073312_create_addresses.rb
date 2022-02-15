class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id,null: false, default: ""
      t.string :address,null: false, default: ""
      t.string :postcode,null: false, default: ""
      t.string :name
      t.timestamps
    end
  end
end
