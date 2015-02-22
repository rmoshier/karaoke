require_dependency './lib/musixmatch'

class LyricsController < ApplicationController
  def index
    artist = params[:artist]
    track = params[:track]
    @subtitles_as_hash = MusixmatchSetter.subtitles_as_hash(track, artist)
    @seconds_and_lyrics = MusixmatchSetter.hash_to_time(@subtitles_as_hash)
    respond_to do |format|
      format.json { render json: @seconds_and_lyrics }
    end
  end
end
