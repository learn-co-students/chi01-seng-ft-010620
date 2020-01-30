require_relative "concerns/slugifiable"
class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :song_genres
  has_many :songs, through: :song_genres
end
