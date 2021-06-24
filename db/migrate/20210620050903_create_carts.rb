class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :shop_id
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
