require 'rails_helper'

RSpec.describe LyricsController, :type => :controller do

  describe "POST 'index'" do
    it "is successful" do
      post :index
      expect(response.status).to eq 200
    end

    # it "returns a json object" do
    #   expect()
    # end
  end

end
