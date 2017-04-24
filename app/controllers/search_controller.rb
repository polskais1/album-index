class SearchController < ApplicationController
  def index
    if !params[:query] || params[:query] == ''
      render json: []
    else
      songs = Song.song_or_relationship_containing(params[:query])
      render json: songs
    end
  end
end