class RenameItemnameColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :itemname, :name
  end
end
