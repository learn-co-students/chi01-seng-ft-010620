class Post
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end

  def add_tag(tag)
    PostTag.new(self, tag)
  end

  def post_tags
    # return all the PostTag objects that contain this particular post, e.g. the ones that "belong to me"
    PostTag.all.select do |post_tag|
      post_tag.post == self
    end
  end

  def tags
    post_tags.map do |post_tag|
      post_tag.tag
    end
  end

end
