class AddColumnShopIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_id, :integer
  end
end
