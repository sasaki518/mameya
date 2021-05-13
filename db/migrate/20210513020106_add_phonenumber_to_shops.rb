class AddPhonenumberToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :phonenumber, :integer
  end
end
