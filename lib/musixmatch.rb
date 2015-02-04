require 'httparty'
require 'json'

class MusixmatchSetter

  def get_track
    url = "http://api.musixmatch.com/ws/1.1/track.search?apikey=1ded3ade3e63977aef9212b43320afb1&q_track=back%20to%20december&q_artist=taylor%20swift&f_has_lyrics=1"
    # url = "http://api.musixmatch.com/ws/1.1/#{method}?apikey=#{ENV['MUSIXMATCH_API_KEY']}&q_track=#{track}&q_artist=#{artist}&f_has_lyrics=1"
    # this method will need to take in three argument (method, track, artist)
    JSON.parse(HTTParty.get(url))
  end

  def get_lyrics
    url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=1ded3ade3e63977aef9212b43320afb1&track_id=9123822"
    # url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=#{ENV['MUSIXMATCH_API_KEY']}&track_id=#{@track_id}"
    # this method will need to take in an argument (track_id)
    JSON.parse(HTTParty.get(url))
  end

end
