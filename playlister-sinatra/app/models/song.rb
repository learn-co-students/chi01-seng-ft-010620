require_relative "concerns/slugifiable"
class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    all_songs = Song.all
    all_songs.find do |song|
      song.slug == slug
    end
  end

end
