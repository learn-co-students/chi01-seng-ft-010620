require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


def num_points_scored(searched_player_name)
  # get a list of all the players
  players = get_players
  # find the player whose name matches the argument 'player_name'
  found_player = find_player(searched_player_name, players)
  # return that player's points
  found_player[:points]
end

def shoe_size(searched_player_name)
  # get a list of all the players
  players = get_players
  # find the player whose name matches the argument 'player_name'
  found_player = find_player(searched_player_name, players)
  # return that player's shoe size
  found_player[:shoe]
end

def find_player(name, player_collection)
  player_collection.find do |player|
    player[:player_name] == name
  end
end


# EXERCISE:
# Define a method called get_names that takes an array of instructors
# and returns just their names.
instructors = [
  {name: 'Alex', hometown: 'upstate ny', mood: 'excited'},
  {name: 'rachel', hometown: 'maine'},
  {name: 'maxwell', hometwon: 'brookyln'}
]

def get_names(instructors)
  # Want to return ['Alex', 'rachel', 'maxwell']
  # Each "instructor" is a hash inside the array 'instructors'
  # I can iterate through the array and use [] notation
  instructors.map do |info|
    info[:name]
  end
end




def get_players
  nested_players = game_hash.values.map do |team|
    team[:players]
  end
  nested_players.flatten
end



# # EXERCISE
# # What do the following return?
#
# arr = (1..100).to_a
#
# arr.map do |num|
#   num.even?
# end
#
# arr.select do |num|
#   7
# end
