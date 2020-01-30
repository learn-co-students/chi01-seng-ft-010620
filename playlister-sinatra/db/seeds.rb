# Add seed data here. Seed your database with `rake db:seed`
Song.destroy_all
Artist.destroy_all



artist_names = ["Busta", "Royce", "Black Thought", "Amy Ray"]

artist_names.each do |artist_name|
  Artist.create(name: artist_name)
end


song_names = ["All About The Harriets", "I Got Twenty On It", "Gimme Some More", "Galileo"]

song_names.each do |song_name|
  Song.create(name: song_name, artist_id: Artist.ids.sample)
end
