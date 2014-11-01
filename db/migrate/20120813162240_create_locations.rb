class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :short_name
      t.string :airport_name
      t.string :icao_identifier
      t.text :description
      t.string :city
      t.string :state
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
