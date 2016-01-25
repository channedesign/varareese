class AddIntroTextToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :intro_text, :string
  end
end
