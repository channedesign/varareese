class AddIntroTextToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :intro_text, :string
  end
end
