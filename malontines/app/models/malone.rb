class Malone < ApplicationRecord
  validates_presence_of :name, :image_url, :description
  validates_uniqueness_of :name, :image_url
  has_many :malontines
  has_many :users, through: :malontines, source: :creator
  has_many :love_notes, through: :malontines
end
