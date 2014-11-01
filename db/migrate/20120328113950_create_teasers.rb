class CreateTeasers < ActiveRecord::Migration
  def self.up
    create_table :teasers do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :teasers
  end
end
