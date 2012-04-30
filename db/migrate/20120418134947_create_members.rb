class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :id
      t.references :user
      t.integer :caf_col_no
      t.date :dd_dues_date
      t.string :first_name
      t.string :last_name
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone
      t.string :email
      t.boolean :active
      t.date :join_date
      t.string :level

      t.timestamps
    end
    add_index :members, :user_id
  end
end
