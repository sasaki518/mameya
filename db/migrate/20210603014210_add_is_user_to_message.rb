class AddIsUserToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :is_user, :boolean, default: false, null: false
  end
end
