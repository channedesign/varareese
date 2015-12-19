class Photo < ActiveRecord::Base
	has_and_belongs_to_many :photo_categories
	
	
	has_attached_file :photo, styles: { thumb: "400x300#" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	

	private 
		def downcase
			self.category = category.downcase
		end

end
