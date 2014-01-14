class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.references :officer_position
      t.references :member
      t.date :term_start
      t.date :term_end

      t.timestamps
    end
    add_index :terms, :officer_position_id
    add_index :terms, :member_id
  end
end
