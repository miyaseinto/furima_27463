class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null:false
      t.string :detail_category, null:false
      t.string :detail_status, null:false
      t.string :delivery_burden, null:false
      t.string :delivery_area, null:false
      t.string :delivery_days, null:false
      t.integer :selling_price, null:false
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
