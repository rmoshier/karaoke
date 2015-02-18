require 'httparty'

###########################################
# RESTART SERVER AFTER EDITING THIS FILE! #
###########################################

class RdioSetter

  def initialize(user)
    create_rdio_client(user)
    get_playlists
  end

  def create_rdio_client(user)
    # Initialize a new Rdio client
    @client = RdioApi.new(:consumer_key => ENV["RDIO_API_KEY"],
                          :consumer_secret => ENV["RDIO_API_SECRET"],
                          :access_token => user.rdio_access_token,
                          :access_secret => user.rdio_access_secret)
                          # :extras => dominantColor
  end

  def get_playlists
    # Get an authenticated user's playlists
    @client.getPlaylists
  end

  def get_color(album)
    thing = @client.search(:query => album, :types => "album", :extras => "dominantColor")
    thing.results[0].dominantColor
    # raise
    # url = "https://api.rdio.com/1/"
    # http://rdioconsole.appspot.com/#query%3Dthe%2Bjackson%2B5%2B-%2Bgreatest%2Bhits%26types%3Dalbum%26extras%3DdominantColor%26method%3Dsearch
    # @album_colors = RdioApi.new()
    # JSON.parse(HTTParty.post(url, query: {query: album, types: "album", extras: "dominantColor", method: "search"}))
  end
end
