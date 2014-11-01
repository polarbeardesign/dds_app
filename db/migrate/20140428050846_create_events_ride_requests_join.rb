class CreateEventsRideRequestsJoin < ActiveRecord::Migration
  def up
    create_table :events_ride_requests, :id => false do |t|
  	  t.integer "event_id"
  	  t.integer "ride_request_id"
  	end
  	add_index :events_ride_requests, ["event_id", "ride_request_id"]
  end

  def down
    drop_table :events_ride_requests
  end
end
