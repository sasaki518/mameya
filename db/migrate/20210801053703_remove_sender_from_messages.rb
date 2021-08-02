class RemoveSenderFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :sender, :string
  end
end
