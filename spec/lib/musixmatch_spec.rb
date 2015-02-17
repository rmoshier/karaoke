require 'spec_helper'
require 'musixmatch'

describe MusixmatchSetter do
  # it "needs arguments to initialize" do
  #   expect { MusixmatchSetter.new }.to raise_error(ArgumentError)
  # end

  let(:track) { MusixmatchSetter.new.get_track("Circus", "Britney Spears") }
  it "returns a json" do
    track.get_track.should be_a json
  end
end

# describe "Person" do
#   let(:person) { Person.new("Bookis") }
#   it "has the name Bookis" do
#     person.name.should eq "Bookis"
#   end
# end
