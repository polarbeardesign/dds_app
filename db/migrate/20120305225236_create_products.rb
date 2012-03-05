class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :item_no
      t.integer :display_order
      t.string :name
      t.text :description
      t.text :size
      t.decimal :value
      t.string :photo_path
      t.boolean :available
      t.decimal :ship_handling

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
