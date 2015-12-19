class Video < ActiveRecord::Base
	
	has_and_belongs_to_many :video_categories


	validates :link, presence: { message: "A link is required!" }, uniqueness: { message: "Video has already been uploaded!" }
	
	
	private 
		def slice_first_and_last
			link = self.link
			if link[0] == "<" && link[link.length - 1] == ">"
				link.slice!(0)
				link.slice!(link.length - 1)
			end
		end

		def add_lazy_load
			link = self.link
			lazy = "class='lazyload' data-"
			if link.exclude?(lazy)
				link.insert(7, lazy)
			end
		end

		def downcase
			self.category = category.downcase
		end
end


