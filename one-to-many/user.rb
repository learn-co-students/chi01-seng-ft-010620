class User
  attr_reader :username

  def initialize(username)
    @username = username
    # @tweets = []
  end

  def tweets
    # I need to get all the tweets there are
    all_tweets = Tweet.all
    # and I need to filter for the ones I wrote
    my_tweets = all_tweets.select do |tweet|
      tweet.username == self.username
    end
    # and return that filtered array
    my_tweets
  end

  def post_tweet(message)
    # Create a Tweet instance with the given message
    # binding.pry
    new_tweet = Tweet.new(message, self)
    # @tweets << new_tweet
    # Associate this ONE user with the tweet that was made
  end
end

# p "user class file"
