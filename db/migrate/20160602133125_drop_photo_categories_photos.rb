class DropPhotoCategoriesPhotos < ActiveRecord::Migration
  def change
  	drop_table :photo_categories_photos
  end
end
