require 'rails_helper'

RSpec.describe Song, type: :model do
  before :all do
    @album = Album.create(title: '[Blackstar]')
    @song = Song.create(title: 'Lazarus', album: @album)
  end

  it 'should have a title' do
    expect(@song.title).to eq('Lazarus')
  end

  context 'when searching by title' do
    it 'should return a result when searching by an existing title' do
      results = Song.title_like('Lazarus')
      expect(results.count).to eq(1)
      expect(results.first.title).to eq('Lazarus')
    end

    it 'should return a result when searching by an existing title using a lowercase string' do
      results = Song.title_like('arus')
      expect(results.count).to eq(1)
      expect(results.first.title).to eq('Lazarus')
    end

    it 'should not return a result when searching by a name that does not exist' do
      results = Song.title_like('Blackstar')
      expect(results.count).to eq(0)
    end
  end
end
