class Photo < ActiveRecord::Base
	has_and_belongs_to_many :photo_categories
	
	acts_as_list
	has_attached_file :photo, styles: { thumb: "215x215#" }, processors: [:papercrop, :thumbnail, :compression]
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	crop_attached_file :photo

	private 
		def downcase
			self.category = category.downcase
		end

end
