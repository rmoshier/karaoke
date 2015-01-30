class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    User.create(
      uid:          auth_hash["uid"].to_s,
      image:        auth_hash["info"]["image"],
      first_name:   auth_hash["info"]["first_name"],
      last_name:    auth_hash["info"]["last_name"]
      # rdio_access_token
      # rdio_access_secret 
    )
  end

  def self.find_or_create_from_omniauth(auth_hash)
    if user = User.find_by(uid: auth_hash["uid"].to_s)
        return user
    else
        User.create_from_omniauth(auth_hash)
    end
  end
end
