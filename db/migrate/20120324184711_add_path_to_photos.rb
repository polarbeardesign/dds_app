class AddPathToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :path, :string
  end

  def self.down
    remove_column :photos, :path
  end
end
