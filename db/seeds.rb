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

puts 'seeding albums'
artists.each do |artist|
  10.times do |i|
    Album.create title: "#{artist.name}'s album no. #{i + 1}", artist: artist
  end
end
