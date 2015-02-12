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
    @subtitles_as_hash = MusixmatchSetter.subtitles_as_hash(track, artist)
    @seconds_and_lyrics = MusixmatchSetter.hash_to_time(@subtitles_as_hash)
    respond_to do |format|
      format.json { render json: @seconds_and_lyrics }
    end
    # with the format json thing above, this makes the @seconds_and_lyrics variable available to the JS as json
    # @seconds_and_lyrics = MusixmatchSetter.new.hash_to_time(@subtitles_as_hash)
    # respond_to do |format|
    #   format.json { render json: @seconds_and_lyrics }
    # end
    # raise
  end

end
