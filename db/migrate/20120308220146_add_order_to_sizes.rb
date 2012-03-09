class AddOrderToSizes < ActiveRecord::Migration
  def self.up
    add_column :sizes, :order, :integer
  end

  def self.down
    remove_column :sizes, :order
  end
end
