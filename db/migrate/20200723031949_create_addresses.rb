class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal, null: false
      t.string :prefectures, null:false
      t.string :area, null:false
      t.string :address, null:false
      t.string :building
      t.string :phone, null:false
      t.bigint :item_id,          null: false
      t.bigint :user_id,          null: false
      t.timestamps
    end
  end
end
