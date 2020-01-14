require_relative 'post'
require_relative 'tag'
require_relative 'post_tag'
require 'pry'

sea_post = Post.new("The Sea", "I support the sound of the sea. It soothes my soul.")

wind_post = Post.new("The Wind", "When the wind wavers, I whisper 'well well well'")

sponsored_post = Post.new("Listicle!", "1. Read more posts; 2. Fear more stuff; 3. Buy more products.")

nature_tag = Tag.new("Nature")
water_tag = Tag.new("Water")
fun_tag = Tag.new("Fun")
shopping_tag = Tag.new("Shopping")

sea_post.add_tag(nature_tag)
sea_post.add_tag(water_tag)
wind_post.add_tag(nature_tag)
sponsored_post.add_tag(shopping_tag)










binding.pry
