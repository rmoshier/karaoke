class User < ActiveRecord::Base
validates :uid, presence: :true
validates :first_name, presence: :true

  def self.create_from_omniauth(auth_hash)
    User.create(
      uid:                  auth_hash["uid"].to_s,
      image:                auth_hash["info"]["image"],
      first_name:           auth_hash["info"]["first_name"],
      last_name:            auth_hash["info"]["last_name"],
      rdio_access_token:    auth_hash["credentials"]["token"],
      rdio_access_secret:   auth_hash["credentials"]["secret"]
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
