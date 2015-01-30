require './lib/rdio'

class HomeController < ApplicationController
  def index
    # RdioSetter.new(session[:user_id])
    RdioSetter.new
    # raise
  end
end
