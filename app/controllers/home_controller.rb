require_dependency './lib/rdio'

class HomeController < ApplicationController
  def index
    if current_user
      @playlists = RdioSetter.new(current_user).get_playlists
      @key = @playlists["owned"][0]["key"]
    end
  end
end
