class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.string :resource
      t.string :operation

      t.timestamps
    end
  end
end
