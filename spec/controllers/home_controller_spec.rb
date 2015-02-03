require 'rails_helper'
require 'spec_helper'

describe HomeController do

  before do
     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:rdio]
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

end
