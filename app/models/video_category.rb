class VideoCategory < ActiveRecord::Base
	has_and_belongs_to_many :videos

	validates :name, presence: { message: "A category name is required!" }, uniqueness: { message: "This category has alredy been created!"}

end