require 'httparty'

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
  end

  def get_playlists
    # Get an authenticated user's playlists
    @client.getPlaylists
  end

end
