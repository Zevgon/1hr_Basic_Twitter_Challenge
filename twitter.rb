require 'byebug'
require_relative 'user.rb'
require_relative 'tweet.rb'

class Twitter
	attr_accessor :users, :tweets
	def initialize
		@users = {}
		@tweets = {}
	end

	def post_tweet(user_id)
		owner = @users[user_id]
		new_tweet = Tweet.new(owner)
		@tweets[new_tweet.id] = new_tweet
		owner.tweets << new_tweet
	end

	def get_news_feed(user_id)
		user = @users[user_id]
		tweet_ids = []
		user.followees.each do |followee|
			followee.tweets.each do |tweet|
				tweet_ids << tweet.id
			end
		end

		tweet_ids
	end

	def follow(follower_id, followee_id)
		follower = @users[follower_id]
		followee = @users[followee_id]
		follower.follow(followee)
	end

	def unfollow(follower_id, followee_id)
		follower = @users[follower_id]
		followee = @users[followee_id]
		follower.unfollow(followee)
	end

	def add_user(user)
		@users[user.id] = user
	end

	alias_method :<<, :add_user
end

t = Twitter.new
user1 = User.new('burfie')
user2 = User.new('lard')
user3 = User.new('flower')
t << user1
t << user2
t << user3
t.follow(1, 2)
t.post_tweet(1)
t.post_tweet(1)
t.follow(1, 3)
t.follow(3, 1)
t.post_tweet(3)
p t.get_news_feed(1)
p t.get_news_feed(2)
p t.get_news_feed(3)
