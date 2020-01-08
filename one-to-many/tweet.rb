class Tweet
  attr_reader :message, :user, :secret
  @@all = []

  def self.all
    @@all
  end

  def self.alphabetized
    # Return a list of all tweets, soretd alphabetically by message
    # @@all.sort do |tweet_one, tweet_two|
    #   tweet_one.message <=> tweet_two.message
    # end

    self.all.sort_by do |tweet|
      tweet.message.downcase
    end
  end

  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def create_secret_message
    @secret = "EUREKA"
  end

  def username
    self.user.username
  end
end
