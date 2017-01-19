class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :menu
      t.integer :parent_id
      t.string :display
      t.string :url
      t.integer :position

      t.timestamps
    end
    add_index :menu_items, :menu_id
  end
end
