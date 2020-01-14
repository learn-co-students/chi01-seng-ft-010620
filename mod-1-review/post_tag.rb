class PostTag
  @@all = []

  attr_reader :post, :tag
  def initialize(post, tag)
    @post = post
    @tag = tag
    @@all << self
  end

  def self.all
    @@all
  end
end
