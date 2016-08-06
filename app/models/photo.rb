class Photo < ActiveRecord::Base
	extend CommonScopes
	belongs_to :photo_categories
	
	acts_as_list
	has_attached_file :photo, styles: { thumb: "215x215#" }, processors: [:papercrop, :thumbnail, :compression]
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	crop_attached_file :photo

	def image_url
		self.photo.url(:thumb)
	end
end
