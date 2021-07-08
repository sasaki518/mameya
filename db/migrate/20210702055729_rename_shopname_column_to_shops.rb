class RenameShopnameColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :shopname, :name
  end
end
