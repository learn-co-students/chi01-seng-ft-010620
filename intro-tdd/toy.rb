class Vehicle
  def move!
    p "VROOOOOM"
  end
end

module Moveable
  def move!
    super
    p "MOVING #{self}..."
  end
end


class Animal
  def initialize(size, age, type, repro_style)

  end

  def grow

  end

  def shed

  end

  def reproduce

  end
end

class Aphid < Animal
  include Moveable
  def move!
    super
    p "I am aphid."
  end

  def grow
    self.age += 1
    self.size *= 1.1
  end
end

class Barnacle < Animal
  def move!
  end

  def grow
    self.age += 1
    self.size *= 1.1
  end
end

class Car < Vehicle
  include Moveable
  def move!
    super
    p "vrrrrrrrrrrm"
  end
end

merkur = Car.new

merkur.move!

aphid = Aphid.new

aphid.move!
