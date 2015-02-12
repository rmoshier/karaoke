require 'httparty'
require 'json'

###########################################
# RESTART SERVER AFTER EDITING THIS FILE! #
###########################################

class MusixmatchSetter

  def self.get_track(track, artist)
    # url = "http://api.musixmatch.com/ws/1.1/track.search?apikey=1ded3ade3e63977aef9212b43320afb1&q_track=back%20to%20december&q_artist=taylor%20swift&f_has_lyrics=1"
    url = "http://api.musixmatch.com/ws/1.1/track.search?"
    # this method will need to take in three argument (method, track, artist)
    JSON.parse(HTTParty.get(url, query: {apikey: ENV['MUSIXMATCH_API_KEY'], q_track: track, q_artist: artist, f_has_lyrics: 1 }))
  end

  def self.get_lyrics(track_id)
    # url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=1ded3ade3e63977aef9212b43320afb1&track_id=9123822"
    url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=#{ENV['MUSIXMATCH_API_KEY']}&track_id=#{track_id}"
    # this method will need to take in an argument (track_id)
    JSON.parse(HTTParty.get(url))
  end

  def self.get_subtitles(track, artist)
    @track = get_track(track, artist)
    @track_id = @track["message"]["body"]["track_list"][0]["track"]["track_id"]
    @lyrics = get_lyrics(@track_id)
    @subtitles = @lyrics["message"]["body"]["subtitle_list"][0]["subtitle"]["subtitle_body"]
    return @subtitles
  end

  def self.subtitles_as_hash(track, artist)
    # raise
    @subtitles = get_subtitles(track, artist)
    chunk = @subtitles.split("\n")
    obj = {}
    chunk.map {|thing| obj[thing[0..10]]=thing[11..-1]}
    return obj
  end

  def self.hash_to_time(obj)
    newtime = obj.map {|thing| thing[0].gsub(/["\[\]]/, "").split(":") }
    seconds = newtime.map { |time| (time[0].to_i * 60) + time[1].to_f }
    # puts seconds
    # finaltime = {}
    finaltime = []
    lyrics = obj.values
    seconds.each_with_index do |number, index|
      # finaltime[number] = lyrics[index]

      finaltime << {time: number, lyrics: lyrics[index]}
    end
    return finaltime
    # raise
  end
  # puts finaltime.to_json #returns json
# ---
    # time = subtitles_as_hash(track, artist).first[0].gsub(/["\[\]]/, "")
    # newtime = time.split(":")
    # seconds = newtime[1].to_f + (60 * newtime[0].to_i)
    # # add in iternation / map the data and return that here
    # # return for each {counter: {time: seconds, lyric: subtitles_as_hash(track, artist).first[1]}}
    # return seconds
    # # then console.log this
    # # raise
  # end

  # def hashtolyric
  # end

end
