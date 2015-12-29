class AddPositionToPhotoCategories < ActiveRecord::Migration
  def change
    add_column :photo_categories, :position, :integer
  end
end
