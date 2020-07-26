class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image, null: false
      t.string :name, null: false
      t.text :explanation, null:false
      t.string :detail_category, null:false
      t.string :detail_status, null:false
      t.string :delivery_burden, null:false
      t.string :delivery_area, null:false
      t.string :delivery_days, null:false
      t.integer :selling_price, null:false
      t.timestamps
    end
  end
end
