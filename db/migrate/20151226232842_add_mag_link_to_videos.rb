class AddMagLinkToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :mag_link, :string
  end
end
