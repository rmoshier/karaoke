require 'rails_helper'

RSpec.describe LyricsController, :type => :controller do

  describe "POST 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

end
