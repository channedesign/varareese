class Photo < ActiveRecord::Base
	before_update :downcase
	#validates :name, uniqueness: true, presence: true
	#validates :category, presence: true
	
	has_attached_file :photo, styles: { thumb: "400x300#" }
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	

	private 
		def downcase
			self.category = category.downcase
		end

end
