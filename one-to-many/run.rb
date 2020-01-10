require_relative "user"
require_relative "tweet"
require_relative "like"
require "pry"
# require_relative "/test/test_req"



coffee_dad = User.new("coffee_dad")
new_msg = "making coffee#"
coffee_dad.post_tweet(new_msg)
coffee_dad.post_tweet("MAKING COFFEE#")
coffee_dad.post_tweet("love coffee")
# p coffee_dad.tweets

matcha_mom = User.new("matcha_mom")
matcha_mom.post_tweet("mmmmmmatcha!")

likable_tweet = Tweet.all[3]
other_likable = Tweet.all[0]
# p likable_tweet
coffee_dad.like_tweet(likable_tweet)
matcha_mom.like_tweet(likable_tweet)
matcha_mom.like_tweet(other_likable)
coffee_dad.like_tweet(other_likable)

p coffee_dad.liked_tweets
