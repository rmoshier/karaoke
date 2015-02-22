require 'httparty'
require 'json'

#################################################
# RESTART LOCAL SERVER AFTER EDITING THIS FILE! #
#################################################

class MusixmatchSetter

  attr_accessor :subtitles, :obj, :finaltime, :track

  def self.get_track(track, artist)
    # Using the track and artist, get the track id from MusixMatch's API.
    url = "http://api.musixmatch.com/ws/1.1/track.search?"
    JSON.parse(HTTParty.get(url, query: {apikey: ENV['MUSIXMATCH_API_KEY'], q_track: track, q_artist: artist, f_has_lyrics: 1 }))
  end

  def self.get_lyrics(track_id)
    # Using the track id, get the lyrics for a particular track from MusixMatch's API.
    url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=#{ENV['MUSIXMATCH_API_KEY']}&track_id=#{track_id}"
    JSON.parse(HTTParty.get(url))
  end

  def self.get_subtitles(track, artist)
    # Returns lyrics object with subtitles and time.
    @track = get_track(track, artist)
    @track_id = @track["message"]["body"]["track_list"][0]["track"]["track_id"]
    @lyrics = get_lyrics(@track_id)
    @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    return @subtitles
  end

  def self.subtitles_as_hash(track, artist)
    # Cleans up data; returns lyrics object as a hash.
    @subtitles = get_subtitles(track, artist)
    chunk = @subtitles.split("\n")
    obj = {}
    chunk.map {|thing| obj[thing[0..10]]=thing[11..-1]}
    return obj
  end

  def self.hash_to_time(obj)
    # Changes time to seconds and returns seconds and lyrics as an array.
    newtime = obj.map {|thing| thing[0].gsub(/["\[\]]/, "").split(":") }
    seconds = newtime.map { |time| (time[0].to_i * 60) + time[1].to_f }
    finaltime = []
    lyrics = obj.values
    seconds.each_with_index do |number, index|
      finaltime << {time: number, lyrics: lyrics[index]}
    end
    return finaltime
  end
end
