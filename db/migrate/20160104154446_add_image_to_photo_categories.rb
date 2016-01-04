class AddImageToPhotoCategories < ActiveRecord::Migration
  def self.up
    add_attachment :photo_categories, :image
  end

  def self.down
    remove_attachment :photo_categories, :image
  end
end
