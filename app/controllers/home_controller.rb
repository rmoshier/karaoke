class HomeController < ApplicationController
  def index
    RdioSetter.new(session[:user_id])
  end
end
