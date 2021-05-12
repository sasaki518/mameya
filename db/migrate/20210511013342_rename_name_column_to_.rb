class RenameNameColumnTo < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :name, :itemname
  end
end
