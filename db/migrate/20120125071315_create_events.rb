class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.references :event_type
      t.string :title
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :URL
      t.string :contact_info
      t.text :details
      t.string :entered_by

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
