class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :item_name,            null: false
      t.text    :item_info,            null: false
      t.integer :category_id,          null: false
      t.integer :item_status_id,       null: false
      t.integer :fee_status_id,        null: false
      t.integer :item_prefecture_id,   null: false
      t.integer :day_id,               null: false
      t.integer :price,                null: false

      t.timestamps
    end
  end
end
