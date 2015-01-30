require_dependency './lib/rdio'

class HomeController < ApplicationController
  def index
    if current_user
      @albums = RdioSetter.new(current_user).heavy_rotation
      # @albums = heavy_rotation
      # @albums = RdioSetter.heavy_rotation
    end
    # raise
    # RdioSetter.new
    # raise
  end
end
