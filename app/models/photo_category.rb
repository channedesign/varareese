class PhotoCategory < ActiveRecord::Base
	has_and_belongs_to_many :photos
	acts_as_list
	validates :name, presence: { message: "A category name is required!" }, uniqueness: { message: "This category has alredy been created!"}
end