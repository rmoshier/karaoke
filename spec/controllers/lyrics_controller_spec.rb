require 'rails_helper'

RSpec.describe LyricsController, :type => :controller do

  # let(:mms) { MusixmatchSetter.new }

  # describe "index" do
  #   it "returns a json" do
  #     mms.subtitles = "some string"
  #     expect(mms.subtitles).to be_an_instance_of Json
  #   end
  # end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

end
