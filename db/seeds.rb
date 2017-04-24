puts 'seeding artists'
artists = [
  Artist.create(name: 'David Bowie'),
  Artist.create(name: 'Radiohead'),
  Artist.create(name: 'A Tribe Called Quest'),
  Artist.create(name: 'Run the Jewels'),
  Artist.create(name: 'Kendrick Lamar'),
  Artist.create(name: 'Kamasi Washington'),
  Artist.create(name: 'Anderson .Paak'),
  Artist.create(name: 'Sufjan Stevens'),
  Artist.create(name: 'Milo'),
  Artist.create(name: 'Susanne Sundfor')
]

artists.each do |artist|
  puts "seeding albums and songs for #{artist.name}"
  10.times do |albums_i|
    album = Album.create(title: "#{artist.name}'s album no. #{albums_i + 1}", artist: artist)
    5.times do |songs_i|
      Song.create(title: "#{album.title}'s track no. #{songs_i + 1}", album: album)
      print '.'
    end
  end
  puts
end
