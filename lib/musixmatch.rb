require 'httparty'
require 'json'

###########################################
# RESTART SERVER AFTER EDITING THIS FILE! #
###########################################

class MusixmatchSetter

  def get_track(track, artist)
    # url = "http://api.musixmatch.com/ws/1.1/track.search?apikey=1ded3ade3e63977aef9212b43320afb1&q_track=back%20to%20december&q_artist=taylor%20swift&f_has_lyrics=1"
    url = "http://api.musixmatch.com/ws/1.1/track.search?"
    # this method will need to take in three argument (method, track, artist)
    JSON.parse(HTTParty.get(url, query: {apikey: ENV['MUSIXMATCH_API_KEY'], q_track: track, q_artist: artist, f_has_lyrics: 1 }))
  end

  def get_lyrics(track_id)
    # url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=1ded3ade3e63977aef9212b43320afb1&track_id=9123822"
    url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=#{ENV['MUSIXMATCH_API_KEY']}&track_id=#{track_id}"
    # this method will need to take in an argument (track_id)
    JSON.parse(HTTParty.get(url))
  end

  def get_subtitles(track, artist)
    @track = get_track(track, artist)
    @track_id = @track["message"]["body"]["track_list"][0]["track"]["track_id"]
    @lyrics = get_lyrics(@track_id)
    @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    return @subtitles
  end

  def subtitles_as_hash(track, artist)
    @subtitles = get_subtitles(track, artist)
    chunk = @subtitles.split("\n")
    obj = {}
    chunk.map {|thing| obj[thing[0..10]]=thing[11..-1]}
    return obj
  end

end
