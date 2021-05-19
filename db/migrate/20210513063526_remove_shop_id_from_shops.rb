class RemoveShopIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :shop_id, :integer
  end
end
