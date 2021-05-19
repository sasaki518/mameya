class AddColumnShopIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shop_id, :integer
  end
end
