class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :gallery
      t.references :photographer
      t.string :photo_title
      t.string :description
      t.string :filename
      t.integer :order

      t.timestamps
    end
    add_index :photos, ["gallery_id", "photographer_id"]
  end

  def self.down
    drop_table :photos
  end
end
