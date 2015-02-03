require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'validations' do
    let(:new_user) { User.new(uid:                  "1234",
                              image:                "image",
                              first_name:           "Rachel",
                              last_name:            "Adler",
                              rdio_access_token:    "token",
                              rdio_access_secret:   "secret")}

    # it "must have an email" do
    #   new_user.email = nil
    #   expect(new_user).to be_invalid
    # end

    it "must have a first name" do
      new_user.first_name = nil
      expect(new_user).to be_invalid
    end

    # it "must have a password" do
    #   new_user.password_digest = nil
    #   expect(new_user).to be_invalid
    # end
  end



  # describe ".create_from_omniauth" do
  # # period indicates this is a class method while octothorp implies instance method
  #   it "returns a hash" do
  #     user = User.create()
  #     expect(user.create_from_omniauth.class).to eq Hash
  #   end
  #
  #   it "should set user_id" do
  #     expect(session[:user_id]).to be_true
  #   end
  # end

end
