require_dependency './lib/rdio'
require_dependency './lib/musixmatch'

class HomeController < ApplicationController
  def index
    if current_user
      @playlists = RdioSetter.new(current_user).get_playlists
      @key = @playlists["owned"][0]["key"]
      @json = MusixmatchSetter.new.response
    end
    # raise
    # @lyrics = MusixmatchSetter.new.lyrics_search
  end
end
