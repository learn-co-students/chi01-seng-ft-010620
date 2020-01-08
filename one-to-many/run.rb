require_relative "user"
require_relative "tweet"
require "pry"
# require_relative "/test/test_req"

# p "yolo"

coffee_dad = User.new("coffee_dad")
# p coffee_dad

new_msg = "making coffee#"
coffee_dad.post_tweet("MAKING COFFEE#")
coffee_dad.post_tweet(new_msg)

# binding.pry
# p tweet.message
# p tweet.user.username

coffee_dad.post_tweet("love coffee")

# puts "Coffee dad's tweets:"
# p coffee_dad.tweets

matcha_mom = User.new("matcha_mom")

matcha_mom.post_tweet("mmmmmmatcha!")
#
# puts "Matcha mom's tweets:"
# mom_first_tweet = matcha_mom.tweets[0]
#
# p mom_first_tweet.username
#
# p coffee_dad.username
# p coffee_dad.tweets

# p Tweet.all

p coffee_dad.tweets

# binding.pry
