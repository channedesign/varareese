class CreateVideoCategoriesVideos < ActiveRecord::Migration
  def change
    create_table :video_categories_videos, id: false do |t|
    	t.belongs_to :video_category
    	t.belongs_to :video
    	t.timestamps
    end
  end
end
