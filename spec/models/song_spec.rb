require 'rails_helper'

RSpec.describe Song, type: :model do
  before :all do
    @artist = Artist.create(name: 'David Bowie')
    @album = Album.create(title: '[Blackstar]', artist: @artist)
    @song = Song.create(title: 'Lazarus', album: @album)
  end

  it 'should have a title' do
    expect(@song.title).to eq('Lazarus')
  end

  context 'when searching by title' do
    it 'should return a result when searching by an existing title' do
      results = Song.title_like('Lazarus')
      expect(results.count).to eq(1)
      expect(results.first.title).to eq(@song.title)
    end

    it 'should return a result when searching by an existing title using a lowercase string' do
      results = Song.title_like('arus')
      expect(results.count).to eq(1)
      expect(results.first.title).to eq(@song.title)
    end

    it 'should not return a result when searching by a name that does not exist' do
      results = Song.title_like('Blackstar')
      expect(results.count).to eq(0)
    end
  end

  context 'when searching for a song or relationship containing a query' do
    it 'should return a result when the artist name is found' do
      results = Song.song_or_relationship_containing('david')
      expect(results.count).to eq(1)
      expect(results.first[:artist].id).to eq(@artist.id)
      expect(results.first[:song].title).to eq(@song.title)
    end

    it 'should return a result when the album title is found' do
      results = Song.song_or_relationship_containing('black')
      expect(results.count).to eq(1)
      expect(results.first[:album].id).to eq(@album.id)
      expect(results.first[:song].title).to eq(@song.title)
    end

    it 'should return a result when the song title is found' do
      results = Song.song_or_relationship_containing('lazarus')
      expect(results.count).to eq(1)
      expect(results.first[:song].title).to eq(@song.title)
    end

    it 'should not return duplicate results when there are artists, albums, or songs with the same name/title' do
      Song.create(title: 'Blackstar', album: @album)
      results = Song.song_or_relationship_containing('black')
      expect(results.count).to eq(2)
      # This is an extra check to make sure we have 2 unique song titles
      song_titles = results.map { |result| result[:song].title }
      expect(song_titles.uniq.count).to eq(2)
    end

    it 'should not return a result when the search string does not match anything' do
      results = Song.song_or_relationship_containing('run')
      expect(results.count).to eq(0)
    end
  end
end
