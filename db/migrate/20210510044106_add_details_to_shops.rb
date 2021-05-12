class AddDetailsToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shopname, :string
    add_column :shops, :description, :text
  end
end
