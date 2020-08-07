class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal, null: false
      t.string :prefectures, null:false
      t.string :area, null:false
      t.string :address, null:false
      t.string :building
      t.integer :phone, null:false
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
