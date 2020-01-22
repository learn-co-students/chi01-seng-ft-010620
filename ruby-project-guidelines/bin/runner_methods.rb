def clear_screen
  puts "\e[H\e[2J"
end


def display_alpha_titles
  clear_screen

  puts "Here are ALL the book titles we've got right now!"
  puts Book.titles_by_alpha
  main_menu_return_prompt
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
  main_menu_return_prompt
end

def add_tag_flow
  clear_screen
  # display books and get user choice
  Book.all.each do |book|
    puts "#{book.id}: #{book.title}"
  end
  puts "Please enter an ID from the above list of titles:"
  book_id_choice = gets.chomp.to_i
  # binding.pry
  # display tags and get user choice
  Tag.all.each do |tag|
    puts "#{tag.name}"
  end
  puts "Please enter one of the above tag names:"
  tag_name_choice = gets.chomp
  found_tag = Tag.find_by(name: tag_name_choice)
  found_book = Book.find(book_id_choice)

  # create tag_assignment object with user choices
  if found_book && found_tag
    TagAssignment.create(book_id: found_book.id, tag_id: found_tag.id)

    puts "Thank you! We have tagged '#{found_book.title}' with the tag '#{found_tag.name}'"
  else
    puts "SORRY! That didn't work. please check your spelling of the tag name and book id."
  end

  main_menu_return_prompt
end

def leave_app
  abort("Goodbye!")
end

def main_menu_return_prompt
  puts "Press ENTER to return to main menu"
  gets.chomp
end
