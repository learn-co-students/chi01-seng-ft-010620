require_relative '../config/environment.rb'

thor = Hero.new("Thor", [
    {
        name: 'Super Strength',
        coolness: 3
    },
    {
        name:'Flight',
        coolness: 5
    },
    {
        name: 'Lighting Blast',
        coolness: 10
    }
])
p thor.name == "Thor"
p thor.abilities.length == 3
thor.add_ability("Getting Over Myself", 9)
p thor.abilities.length == 4

binding.pry
