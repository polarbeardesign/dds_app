class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.references :gallery_category
      t.string :gallery_name
      t.string :description
      t.string :gallery_pic

      t.timestamps
    end
    add_index :galleries, :gallery_category_id
  end

  def self.down
    drop_table :galleries
  end
end
