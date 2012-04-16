class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :source
      t.text :ext_url
      t.boolean :publish
      t.boolean :members_only

      t.timestamps
    end
  end
end
