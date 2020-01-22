require_relative '../config/environment'
require_relative 'runner_methods'
ActiveRecord::Base.logger = nil

# -------------------------------------------
# -------------------------------------------

while true
  clear_screen
  puts "WELCOME TO BOOK TAGGER"

  puts "Select 1 to see all titles alphabetized,"
  puts "Select 2 to view books by tag name"
  puts "Select 3 to add a tag to a book"
  puts "Type 'exit' to leave this app"

  user_choice = gets.chomp

  if user_choice == "1"
    display_alpha_titles
  elsif user_choice == "2"
    handle_tag_search
  elsif user_choice == "3"
    add_tag_flow
  elsif user_choice == "exit"
    leave_app
  else
    clear_screen
    puts "I didn't get that, please choose from one of the options displayed..."
    sleep(4)
  end
end
# binding.pry
