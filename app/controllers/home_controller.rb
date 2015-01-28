class HomeController < ApplicationController
  def index
    # Initialize a new Rdio client
    @client = RdioApi.new(:consumer_key => RDIO_API_KEY, :consumer_secret => RDIO_API_SECRET)
  end
end
