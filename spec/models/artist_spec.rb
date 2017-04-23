require 'rails_helper'

RSpec.describe Artist, type: :model do
  before :all do
    @artist = Artist.create(name: 'David Bowie')
  end

  it 'should have a name' do
    expect(@artist.name).to eq('David Bowie')
  end

  context 'when searching by name' do
    it 'should return a result when searching by an existing name' do
      results = Artist.name_like('David')
      expect(results.count).to eq(1)
      expect(results.first.name).to eq('David Bowie')
    end

    it 'should not return a result when searching by a name that does not exist' do
      results = Artist.name_like('Frank')
      expect(results.count).to eq(0)
    end
  end
end
