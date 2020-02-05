class Kitten < ApplicationRecord
  validates_presence_of :name, :age
end
