require 'sqlite3'
require 'pry'


db = SQLite3::Database.new('chinook.db')

result = db.execute("SELECT artists.name, albums.title
FROM artists JOIN albums
ON artists.id = albums.artist_id;")

binding.pry
