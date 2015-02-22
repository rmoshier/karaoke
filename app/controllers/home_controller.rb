require_dependency './lib/rdio'
require_dependency './lib/musixmatch'

class HomeController < ApplicationController
  def index
    if current_user
      @playlists = RdioSetter.new(current_user).get_playlists
      @key = @playlists["owned"][0]["key"]
    end
  end

  def album
    album = params[:album]
    @albumcolor = RdioSetter.new(current_user).get_color(album)
    respond_to do |format|
      format.json { render json: @albumcolor }
    end
  end
end
