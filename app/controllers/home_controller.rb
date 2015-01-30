require_dependency './lib/rdio'

class HomeController < ApplicationController
  def index
    if current_user
      RdioSetter.new(current_user)
      @albums = heavy_rotation
      # @albums = RdioSetter.heavy_rotation
    end
    # raise
    # RdioSetter.new
    # raise
  end
end
