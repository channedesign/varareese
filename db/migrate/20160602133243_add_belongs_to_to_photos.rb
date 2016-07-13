class AddBelongsToToPhotos < ActiveRecord::Migration
  def change
  	add_reference :photos, :photo_category, index: true
  end
end
