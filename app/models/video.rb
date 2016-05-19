class Video < ActiveRecord::Base
	before_validation :thumb
	has_and_belongs_to_many :video_categories

	acts_as_list
	validates :link, presence: { message: "A link is required!" }, uniqueness: { message: "Video has already been uploaded!" }
	
	private 
		def thumb
			link =  self.link
			url = 'http://vimeo.com/api/v2/video/' + link + '.json'
			uri = URI(url)
			response = Net::HTTP.get(uri)
			data = JSON.parse(response)
			self.thumb_link = data[0]["thumbnail_large"]
		end
end


