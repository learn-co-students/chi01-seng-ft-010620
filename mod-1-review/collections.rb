require 'pry'

flavors = ["Chocolate", "Vanilla", "Strawberry", "Pistachio", "Grape", "Lemon", "Mint", "Jasmine", "Rose"]

semester_grades = [
  { class: "Math", absences: 0, grade: "B" },
  { class: "Science", absences: 2, grade: "A" },
  { class: "History", absences: 2, grade: "C" },
  { class: "Art", absences: 1, grade: "A" },
]

class Snail
  attr_accessor :races

  @@all = []

  def self.all
    @@all
  end

  def initialize(races)
    self.races = races
    self.class.all << self
  end

  def all_race_names
    # return a list of names of all the races I've been in
    # all_names = []
    # self.races.each do |race|
    #   all_names << race[:name]
    # end
    # all_names

    # self.races.map do |race|
    #   race[:name]
    # end

    self.races.map(&:[])

  end
end

races = [
  { color: "blue", name: "Slimy Circuit", surface: "dirt", placement: 2 },
  { color: "red", name: "Garden Rush", surface: "grass/dirt", placement: 3 },
  { color: "silver", name: "Surfer Sprint", surface: "water/pavement", placement: 1 },
  { color: "blue", name: "Another Race", surface: "pavement", placement: 1 }
]

class Race
  attr_reader :color, :name, :surface, :placement

  # {:color=>"blue",
  #   :name=>"Slimy Circuit",
  #   :surface=>"dirt",
  #   :placement=>2}
  def initialize(race_info = {})
    @color = race_info[:color]
    @name = race_info[:name]
    @surface = race_info[:surface]
    @placement = race_info[:placement]
  end
end

# race_objects = [#<Race Instance>, #<Race Instance>, #<Race Instance>, #<Race Instance>]

binding.pry
