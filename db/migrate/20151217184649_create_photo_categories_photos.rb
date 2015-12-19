class CreatePhotoCategoriesPhotos < ActiveRecord::Migration
  def change
    create_table :photo_categories_photos, id: false do |t|
    	t.belongs_to :photo_category
    	t.belongs_to :photo
    	t.timestamps
    end
  end
end
