class Artist
  @@db = SQLite3::Database.new('chinook.db')

  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.all
    # Should return an array of Track instances, one per row in the database's "tracks" table
    artists_info_from_db = @@db.execute("SELECT * FROM artists;")
    artists_info_from_db.map do |artist_info|
      Artist.new(artist_info[0], artist_info[1])
    end
  end

  def save
    if self.id
      # If id is present, this has been saved before! Time to update that record
      @@db.execute("UPDATE artists SET name = '#{self.name}'du WHERE id = #{self.id}")
      return self
    else
      # If there is no id present, the database hasn't assigned one yet...hey! That means we've got a brand new object!
      @@db.execute("INSERT INTO artists (name) VALUES ('#{self.name}')")
      self.id = @@db.last_insert_row_id
      return self
    end
  end
end
