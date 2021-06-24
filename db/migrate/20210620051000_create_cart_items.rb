class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :item_id
      t.string :integer
      t.string :count
      t.string :integer

      t.timestamps
    end
  end
end
