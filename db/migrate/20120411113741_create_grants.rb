class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :right_id
      t.integer :role_id

      t.timestamps
    end
  end
end
