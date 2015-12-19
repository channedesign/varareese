class RemoveCategoryFromPhotos < ActiveRecord::Migration
  def change
  	remove_column :photos, :category, :string
  end
end
