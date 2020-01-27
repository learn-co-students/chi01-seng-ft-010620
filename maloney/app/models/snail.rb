class Snail < ActiveRecord::Base
  validates :name, presence: true
end
