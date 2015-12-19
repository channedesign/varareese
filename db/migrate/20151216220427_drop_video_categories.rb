class DropVideoCategories < ActiveRecord::Migration
  def change
  	drop_table :video_categories
  		t.string :name
  		t.timestamps
  end
end
