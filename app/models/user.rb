class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    User.create(
      uid:        auth_hash["uid"].to_s,
      # photo_url:  auth_hash["info"]["image"],
      first_name:   auth_hash["info"]["fist_name"],
      last_name: auth_hash["info"]["last_name"]
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
