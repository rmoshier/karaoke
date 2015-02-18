require_dependency './lib/rdio'
require_dependency './lib/musixmatch'

class HomeController < ApplicationController
  def index
    if current_user
      @playlists = RdioSetter.new(current_user).get_playlists
      @key = @playlists["owned"][0]["key"]
      # raise
      # @track = MusixmatchSetter.new.get_track
      # @track_id = @track["message"]["body"]["track_list"][0]["track"]["track_id"]
      # @lyrics = MusixmatchSetter.new.get_lyrics
      # @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
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
