class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.boolean :active
      t.string :source

      t.timestamps
    end
  end
end
