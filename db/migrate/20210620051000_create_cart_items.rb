class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false
      t.integer :count, null: false
      t.integer :cart_id
      t.timestamps
    end
  end
end
