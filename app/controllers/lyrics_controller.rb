require_dependency './lib/musixmatch'

class LyricsController < ApplicationController
  def index
    # here make call to mm api which renders lyrics -  or track_id?
    @lyrics = MusixmatchSetter.new.get_lyrics
    @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    render :nothing => true
  end

end
