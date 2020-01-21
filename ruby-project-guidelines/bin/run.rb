require_relative '../config/environment'
ActiveRecord::Base.logger = nil

def clear_screen
  puts "\e[H\e[2J"
end


def display_alpha_titles
  clear_screen

  puts "Here are ALL the book titles we've got right now!"
  puts Book.titles_by_alpha
end

def handle_tag_search
  clear_screen

  puts "Please select from the following options:"

  Tag.all.each_with_index do |tag, index|
    puts "#{index + 1}. #{tag.name.capitalize}"
  end

  user_option = gets.chomp

  case user_option
  when "1"
    tag_name = "funny"
  when "2"
    tag_name = "scary"
  when "3"
    tag_name = "smart"
  end

  display_tag = Tag.find_by(name: tag_name)

  books_to_show = display_tag.books.uniq

  clear_screen

  puts "Books found! Here is your list:"

  books_to_show.each do |book|
    puts book.list_display
  end
end

clear_screen
puts "WELCOME TO BOOK TAGGER"

puts "Select 1 to see all titles alphabetized,"
puts "Select 2 to view books by tag name"

user_choice = gets.chomp

if user_choice == "1"
  display_alpha_titles
elsif user_choice == "2"
  handle_tag_search
else
  puts "Ok then...peace?"
end

binding.pry
