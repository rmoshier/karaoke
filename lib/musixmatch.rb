require 'httparty'
require 'json'

class MusixmatchSetter

  # include HTTParty
  # base_uri 'http://api.musixmatch.com/ws/1.1/'

  # def initialize
  #   response
  # end

  def response
    # url = "https://api.flickr.com/services/rest/?&method=#{method}&api_key=#{ENV['FLICKR_KEY']}&#{id_type}=#{id}#{extras}"
    url = "http://api.musixmatch.com/ws/1.1/track.search?apikey=1ded3ade3e63977aef9212b43320afb1&q_track=back%20to%20december&q_artist=taylor%20swift&f_has_lyrics=1"
    # url = "http://api.musixmatch.com/ws/1.1/#{method}?apikey=#{ENV['MUSIXMATCH_API_KEY']}&q_track=back%20to%20december&q_artist=taylor%20swift&f_has_lyrics=1"
    # response = HTTParty.get(url)
    # @response = response.parsed_response
    JSON.parse(HTTParty.get(url))
  end

  def lyrics
    url = "http://api.musixmatch.com/ws/1.1/track.subtitles.get?apikey=1ded3ade3e63977aef9212b43320afb1&track_id=9123822"
    JSON.parse(HTTParty.get(url))
    # next work on ajax call updated the above link with the appropriate information
    # also need to update method names so they correspond with the musixmatch method names for clarity
  end

  # when they press play load in artist and albumn name as variables into fat url
  # take it in and run a method were for every space we throw in a '%'
  # uri encoding = % in place of spaces



  # def initialize
  #   create_musixmatch_client
  #   lyrics_search
  # end
  #
  # def create_musixmatch_client
  #   @mmclient = MusixMatch::API::Base.api_key = ENV['MUSIXMATCH_API_KEY']
  # end
  #
  # def lyrics_search
  #   @response = MusixMatch.search_lyrics(:q_artist => 'Pantera')
  #   if @response.status_code == 200
  #     @response.each do |lyrics|
  #       puts "#{lyrics.lyrics_id}: #{lyrics.track_name} (#{lyrics.artist_name})"
  #     end
  #   end
  # end

end
