require 'rails_helper'

RSpec.describe Album, type: :model do
  before :all do
    @artist = Artist.create(name: 'David Bowie')
    @album = Album.create(title: '[Blackstar]', artist: @artist)
  end

  it 'should have a title' do
    expect(@album.title).to eq('[Blackstar]')
  end

  context 'when searching by title' do
    it 'should return a result when searching by an existing title' do
      results = Album.title_like('star')
      expect(Album.count).to eq(1)
      expect(results.count).to eq(1)
      expect(results.first.title).to eq('[Blackstar]')
    end

    it 'should return a result when searching by an existing title using a lowercase string' do
      results = Album.title_like('black')
      expect(results.count).to eq(1)
      expect(results.first.title).to eq('[Blackstar]')
    end

    it 'should not return a result when searching by a name that does not exist' do
      results = Album.title_like('Run')
      expect(results.count).to eq(0)
    end
  end
end
