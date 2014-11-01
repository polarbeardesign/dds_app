class AddGraphicToEvent < ActiveRecord::Migration
  def change
    add_column :events, :graphic_address, :string
  end
end
