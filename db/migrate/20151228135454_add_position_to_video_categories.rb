class AddPositionToVideoCategories < ActiveRecord::Migration
  def change
    add_column :video_categories, :position, :integer
  end
end
