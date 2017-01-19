class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :user
      t.string :title
      t.text :body
      t.string :slug
      t.datetime :published_at

      t.timestamps
    end
    add_index :contents, :user_id
  end
end
