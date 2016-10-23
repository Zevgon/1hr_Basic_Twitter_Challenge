class User
	@@user_count = 0
	attr_accessor :followers, :tweets
	attr_reader :id, :username, :followees
	def initialize(username)
		@@user_count += 1
		@id = @@user_count
		@username = username
		@tweets = []
		@followers = []
		@followees = []
	end

	def follow(other_user)
		return if other_user == self
		other_user.followers << self
		@followees << other_user
	end

	def unfollow(other_user)
		other_user.followers.delete(self)
		self.followees.delete(other_user)
	end
end
