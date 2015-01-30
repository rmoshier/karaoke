require 'httparty'

class RdioSetter

  def initialize(user_id)
    create_rdio_client
    heavy_rotation
  end

  def create_rdio_client
    # Initialize a new Rdio client
    @client = RdioApi.new(:consumer_key => RDIO_API_KEY, :consumer_secret => RDIO_API_SECRET)
  end

  def heavy_rotation
    # Get songs in heavy rotation
    @client.getHeavyRotation(:type => "albums")
  end

end

# Methods that act on behalf of a user require an access token, OmniAuth is best for this

Access token can be set at initialization
client = RdioApi.new(:consumer_key => CONSUMER_KEY,
                     :consumer_secret => CONSUMER_SECRET,
                     :access_token => ACCESS_TOKEN,
                     :access_secret => ACCESS_SECRET)
