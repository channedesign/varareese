class VideoCategory < ActiveRecord::Base
	extend CommonScopes
	has_many :videos, dependent: :destroy

	acts_as_list
	validates :name, presence: { message: "A category name is required!" }, uniqueness: { message: "This category has alredy been created!"}
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/



	def image_url
		self.image.url
	end
end
