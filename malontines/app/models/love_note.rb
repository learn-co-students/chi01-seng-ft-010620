class LoveNote < ApplicationRecord
  validates_presence_of :message
  validates_uniqueness_of :message
  has_many :malontines
  has_many :users, through: :malontines, source: :creator
  has_many :malones, through: :malontines
end
