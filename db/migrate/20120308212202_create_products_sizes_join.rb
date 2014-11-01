class CreateProductsSizesJoin < ActiveRecord::Migration
  def self.up
    create_table :products_sizes, :id => false do |t|
      t.integer "product_id"
      t.integer "size_id"
    end
  add_index :products_sizes, ["product_id", "size_id"]
  end

  def self.down
    drop_table :products_sizes
  end
end
