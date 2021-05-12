class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :gram
      t.string :roasting
      t.integer :sourness
      t.integer :bitterness
      t.integer :aroma
      t.integer :body
      t.integer :aftertaste

      t.timestamps
    end
  end
end
