class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name,                         null: false
      t.text :explanation,                  null: false
      t.integer :price,                     null: false
      t.integer :category_id,               null: false
      t.integer :condition_id,              null: false
      t.integer :delivery_pattern_id,       null: false
      t.integer :consignor_area_id,         null: false
      t.integer :delivery_day_id,           null: false
      t.integer :user_id,                   null: false, foreign_key: true
      t.timestamps
    end
  end
end
