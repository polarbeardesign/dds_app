class CreateEventSignups < ActiveRecord::Migration
  def change
    create_table :event_signups do |t|
      t.references :events
      t.references :members

      t.timestamps
    end
    add_index :event_signups, :events_id
    add_index :event_signups, :members_id
  end
end
