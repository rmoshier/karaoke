require_dependency './lib/musixmatch'

class LyricsController < ApplicationController
  def index
    # here make call to mm api which renders lyrics -  or track_id?
    # @lyrics = MusixmatchSetter.new.get_lyrics
    # @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    artist = params[:artist]
    track = params[:track]
    # subtitles = MusixmatchSetter.new.get_subtitles(track, artist)
    # url = "http://api.musixmatch.com/ws/1.1/#{method}?apikey=#{ENV['MUSIXMATCH_API_KEY']}&q_track=#{track}&q_artist=#{artist}&f_has_lyrics=1"
    @subtitles_as_hash = MusixmatchSetter.new.subtitles_as_hash(track, artist)
    respond_to do |format|
      format.json { render json: @subtitles_as_hash }
    end
  end

end
