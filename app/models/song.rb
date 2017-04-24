class Song < ApplicationRecord
  belongs_to :album

  scope :title_like, -> (title) { where('title like ?', "%#{title}%") }

  def self.song_or_relationship_containing(query)
    [
      search_by_artists(Artist.name_like(query)),
      search_by_albums(Album.title_like(query)),
      search_by_songs(title_like(query))
    ].flatten.uniq
  end

  private

  def self.search_by_artists(artists)
    artists.map do |artist|
      artist.albums.map do |album|
        album.songs.map do |song|
          { artist: artist, album: album, song: song }
        end
      end
    end
  end

  def self.search_by_albums(albums)
    albums.map do |album|
      album.songs.map do |song|
        { artist: album.artist, album: album, song: song }
      end
    end
  end

  def self.search_by_songs(songs)
    songs.map do |song|
      { artist: song.album.artist, album: song.album, song: song }
    end
  end
end
