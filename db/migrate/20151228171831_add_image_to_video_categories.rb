class AddImageToVideoCategories < ActiveRecord::Migration
  def self.up
    add_attachment :video_categories, :image
  end

  def self.down
    remove_attachment :video_categories, :image
  end
end
