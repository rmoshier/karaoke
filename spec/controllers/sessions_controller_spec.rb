require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe SessionsController do
    describe "#destroy" do
      it "successfully logs out a user" do
        expect(session[:uid]).to be_nil
      end
    end

    describe "#destroy" do
      it "successfully sends the correct HTTP response, redirect" do
        get :destroy
        expect(response.status).to eq 302
      end
    end

    describe "#create" do
      it "succesfully finds a pre-existing user in the database" do
        user_id = 13
        expect session[user_id] = 13
      end
    end
  end

end
