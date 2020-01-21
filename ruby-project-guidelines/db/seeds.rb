require 'net/http'

Book.destroy_all
Tag.destroy_all
TagAssignment.destroy_all

url = "https://www.googleapis.com/books/v1/volumes?q=snail"

uri = URI(url)

response = Net::HTTP.get(uri)

response_hash = JSON.parse(response)

books_info = response_hash["items"]

books_info.each do |book_info|
  Book.create(title: book_info["volumeInfo"]["title"], authors: book_info["volumeInfo"]["authors"].join(", "),
  description: book_info["volumeInfo"]["description"])
end

# 100.times do
#   Book.create(title: Faker::Book.title, authors: Faker::Book.author, description: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote)
# end

tag_names = ["funny", "scary", "smart"]

tag_names.each do |tag_name|
  Tag.create(name: tag_name)
end

20.times do
  TagAssignment.create(tag_id: Tag.ids.sample, book_id: Book.ids.sample)
end



binding.pry
