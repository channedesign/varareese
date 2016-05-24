class DropVideoCategoriesVideos < ActiveRecord::Migration
  def change
  	drop_table :video_categories_videos
  end
end
