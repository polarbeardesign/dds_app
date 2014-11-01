class ChangeOrderToSizes < ActiveRecord::Migration
  def self.up
    rename_column :sizes, :order, :display_order
  end

  def self.down
    rename_column :sizes, :display_order, :order
  end
end
