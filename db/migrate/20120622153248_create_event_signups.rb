class CreateEventSignups < ActiveRecord::Migration
  def change
    create_table :event_signups do |t|
      t.references :event
      t.references :member
      t.string :commitment_level

      t.timestamps
    end
    add_index :event_signups, :event_id
    add_index :event_signups, :member_id
  end
end
