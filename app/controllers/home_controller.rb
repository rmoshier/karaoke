require_dependency './lib/rdio'
require_dependency './lib/musixmatch'

class HomeController < ApplicationController
  def index
    if current_user
      @playlists = RdioSetter.new(current_user).get_playlists
      @key = @playlists["owned"][0]["key"]
      @json = MusixmatchSetter.new.response
      @track_id = @json["message"]["body"]["track_list"][0]["track"]["track_id"]
      @lyrics = MusixmatchSetter.new.lyrics
      @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    end
  end
end
