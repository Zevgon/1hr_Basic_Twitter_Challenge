class Tweet
	@@tweet_count = 0
	attr_reader :id
	def initialize(owner, text = '')
		@@tweet_count += 1
		@id = @@tweet_count
		@owner = owner
		@text = text
	end
end
