class AddThumbLinkToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :thumb_link, :string
  end
end
