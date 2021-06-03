class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :room_id
      t.string :sender
      t.reference :room, foreign_key: true
      r.reference :user, foreign_key: true
      t.timestamps
    end
  end
end
