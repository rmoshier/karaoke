require_dependency './lib/rdio'

class HomeController < ApplicationController
  def index
    if current_user
      @albums = RdioSetter.new(current_user).heavy_rotation
      # @rdio_user = RdioSetter.new(current_user).rdio_user
      # @playlists = RdioSetter.new(current_user).get_playlists
    end
  end
end
