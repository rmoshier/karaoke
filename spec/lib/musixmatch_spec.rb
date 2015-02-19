require 'spec_helper'
require 'musixmatch'

describe MusixmatchSetter do

  let(:mms) { MusixmatchSetter.new }

  describe ".get_subtitles" do
    it "returns a string" do
      mms.subtitles = "some string"
      expect(mms.subtitles).to be_an_instance_of String
    end
  end

  describe ".subtitles_as_hash" do
    it "returns a hash" do
      mms.obj = {:some => "hash"}
      expect(mms.obj).to be_an_instance_of Hash
    end
  end

  describe ".hash_to_time" do
    it "returns an array" do
      mms.finaltime = ["some", "array"]
      expect(mms.finaltime).to be_an_instance_of Array
    end
  end
end

# describe "Person" do
#   let(:person) { Person.new("Bookis") }
#   it "has the name Bookis" do
#     person.name.should eq "Bookis"
#   end
# end
