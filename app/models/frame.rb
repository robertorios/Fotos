class Frame < ActiveRecord::Base
	 update_index('frames#frame') { self }

	def self.search(keyword)
		keyword.downcase!
		frame_ids = FramesIndex::Frame.query(
						multi_match: {
							query: keyword,
							type: "phrase_prefix",
							fields: ["title^3", "tags"]
							# boost es
						}	
					).map { |result|
					result.attributes["id"] }
		self.find(frame_ids)
	end

	def self.owner(email)
		email.downcase!
			FramesIndex::Frame.query(
					term: {
						email: email
						# we need to create analyzer (tokenizer) in es to match email
						# at the moment it will match evrything before or after @
					}
			)
	end

end