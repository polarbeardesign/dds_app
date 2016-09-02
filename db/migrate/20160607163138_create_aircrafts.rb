class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :type
      t.string :name
      t.string :n_number
      t.text :description

      t.timestamps
    end
  end
end
