module Slugifiable
  def slug
    name.downcase.gsub(" ", "-")
  end

  # What if it's not all title case
  # def self.name_from_slug(slug)
  #   slug.gsub("-", " ").titleize
  # end

  # YAGNI - Ya Ain't Gonna Need It! I'll uncomment this when I get to a second class's slug search work. Right now I'm only doing it on songs, so premature abstraction isn't worth it.
  # def self.find_by_slug(slug, class_name)
  #   all_items = class_name.all
  #   all_items.find do |item|
  #     item.slug == slug
  #   end
  # end

end
