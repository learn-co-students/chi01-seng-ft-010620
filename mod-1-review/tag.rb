class Tag
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def post_tags
    # output = []
    # PostTag.all.each do |pt|
    #   if pt.tag == self
    #     output << pt
    #   end
    # end
    # output

    PostTag.all.select do |post_tag|
      post_tag.tag == self
    end
  end

  def posts
    # Show all posts where I was a tag on that post
    # Start with the Post Tag join
    # For each of the post tags,
    # compare the nested tag with myself
    # and filter for all the ones where they're the same.
    # then when I've got that filtered list of post tags,
    # each one will contain a tag (myself!)
    # and a post
    # I only need the post objects from each found post_tag

    post_tags.map do |post_tag|
      post_tag.post
    end
  end

end
