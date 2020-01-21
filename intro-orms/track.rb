
class Track
  @@db = SQLite3::Database.new('chinook.db', results_as_hash: true)

  attr_accessor :id, :name, :genre_id, :album_id, :composer, :milliseconds, :bytes, :unit_price

  def initialize(track_hash)
    @id = track_hash["id"]
    @name = track_hash["name"]
    @genre_id = track_hash["genre_id"]
    @album_id = track_hash["album_id"]
    @composer = track_hash["composer"]
    @milliseconds = track_hash["milliseconds"]
    @bytes = track_hash["bytes"]
    @unit_price = track_hash["unit_price"]
  end

  def self.all
    # Should return an array of Track instances, one per row in the database's "tracks" table
    all_tracks_info = @@db.execute("SELECT * FROM tracks;")
    # binding.pry
    self.instances_from_db_rows(all_tracks_info)
  end

  def self.instances_from_db_rows(rows)
    rows.map { |row| Track.new(row) }
  end

  def self.where(query)
    param = query.keys[0]
    value = query.values[0]
    # binding.pry
    results = @@db.execute("SELECT * FROM tracks WHERE #{param} = '#{value}'")
    self.instances_from_db_rows(results)
  end

  def save
    # Should save this instance to the database, being mindful of whether we are adding or updating a row in "tracks"
  end

end
