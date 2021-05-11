class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :sponsor_name
      t.string :url
      t.string :logo
      t.text :notes

      t.timestamps
    end
  end
end
