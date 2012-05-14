class AddGraphicToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :video_graphic, :string
  end
end
