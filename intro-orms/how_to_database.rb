require 'sqlite3'
require 'pry'
require_relative 'track'
require_relative 'artist'


db = SQLite3::Database.new('chinook.db')

# result = db.execute("SELECT artists.name, albums.title
# FROM artists JOIN albums
# ON artists.id = albums.artist_id;")

Track.all

found_tracks = Track.where({"genre_id" => 2})
binding.pry
