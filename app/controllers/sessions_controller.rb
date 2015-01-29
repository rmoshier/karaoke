class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    session[:user_id] = User.find_or_create_from_omniauth(auth_hash).uid
    # raise
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
