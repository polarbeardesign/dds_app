class CreateRideRequests < ActiveRecord::Migration
  def change
    create_table :ride_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
