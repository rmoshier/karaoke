require 'httparty'

class RdioSetter

  def initialize(user)
    create_rdio_client(user)
    heavy_rotation
  end

  def create_rdio_client(user)
    # Initialize a new Rdio client
    @client = RdioApi.new(:consumer_key => ENV["RDIO_API_KEY"],
                          :consumer_secret => ENV["RDIO_API_SECRET"],
                          :access_token => user.rdio_access_token,
                          :access_secret => user.rdio_access_secret)
  end

  def heavy_rotation
    # Get songs in heavy rotation
    @client.getHeavyRotation(:type => "albums")
  end

end

# client = RdioApi.new(:consumer_key => CONSUMER_KEY,
#                      :consumer_secret => CONSUMER_SECRET,
