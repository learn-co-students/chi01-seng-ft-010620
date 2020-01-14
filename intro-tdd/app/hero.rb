class Hero
  attr_accessor :name, :abilities

  # Accepts an array of abilities
  # Each ability will be represented by a hash with a name and "coolness" rating
  def initialize(name, abilities)
    self.name = name
    self.abilities = abilities
  end

  # Returns the heros coolest ability
  def coolest_ability
    coolest_ability = nil
    abilities.each do | current_ability |
      if coolest_ability == nil || current_ability[:coolness] > coolest_ability[:coolness]
        coolest_ability = current_ability
      end
    end
    coolest_ability
  end

  def abilities_by_coolness
    # Get all the abilities in order of coolness
    @abilities.sort_by do |a|
      a[:coolness]
    end
  end

  def three_coolest_abilities
    # Run our existing method, reverse output, and constrain to first three
    abilities_by_coolness.reverse[0..2]
  end

  def add_ability(name,coolness)
    if name.class == String && name.length > 0 && coolness.class == Integer
      self.abilities << {name: name, coolness: coolness}
    else
      raise ArgumentError, "name must be a string and coolness must be an integer"
    end
  end

  def ordered_abilities
    # returns abilities ordered alphabetically by name
  end

  def destined_abilities
    # returns all the abilities whose names are exactly as long as the hero's name

  end
end
