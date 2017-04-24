class SearchController < ApplicationController
  def index
    songs = Song.song_or_relationship_containing(params[:query])
    render json: songs
  end
end