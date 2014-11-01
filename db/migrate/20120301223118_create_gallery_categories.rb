class CreateGalleryCategories < ActiveRecord::Migration
  def self.up
    create_table :gallery_categories do |t|
      t.string :category_name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_categories
  end
end
