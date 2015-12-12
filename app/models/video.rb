class Video < ActiveRecord::Base
	before_save { self.category = category.downcase }
	

	validates :link, presence: { message: "A link is required" }, uniqueness: { message: "Video has already been uploaded" }

	
end


