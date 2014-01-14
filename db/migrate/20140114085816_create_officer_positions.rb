class CreateOfficerPositions < ActiveRecord::Migration
  def change
    create_table :officer_positions do |t|
      t.string :position_name
      t.text :description

      t.timestamps
    end
  end
end
