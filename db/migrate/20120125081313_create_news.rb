class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.text :content
      t.date :date
      t.string :source
      t.string :ext_url

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
