class CreateInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :infomations do |t|
      t.text :postcode,                         null: false
      t.integer :prefecture_id,                 null: false
      t.text :city,                             null: false
      t.text :street,                           null: false
      t.text :building_name
      t.string :phone_number,                   null: false
      t.integer :user_id,                       null: false, foreign_key: true
      t.timestamps
    end
  end
end
