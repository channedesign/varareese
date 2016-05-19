class PhotoCategory < ActiveRecord::Base
	has_and_belongs_to_many :photos
	
	acts_as_list
	validates :name, presence: { message: "A category name is required!" }, uniqueness: { message: "This category has alredy been created!" }
	has_attached_file :image, styles: { thumb: "300x200" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	crop_attached_file :image, :aspect => "16:9"
end