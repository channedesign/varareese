module CommonScopes
	def order_by_position
		order("position ASC")
	end

	def reel
		where(name: "Reel").first
	end
end