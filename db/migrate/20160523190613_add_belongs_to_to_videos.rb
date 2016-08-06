class AddBelongsToToVideos < ActiveRecord::Migration
  def change
  	add_reference :videos, :video_category, index: true
  end
end
