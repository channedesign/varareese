class AddMagToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :mag, :string
  end
end
