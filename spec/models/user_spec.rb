require 'rails_helper'

RSpec.describe User, :type => :model do

  describe ".create" do
    it "must have an uid" do
      expect(User.new(uid: nil)).to_not be_valid
    end

    it "must have an name" do
      expect(User.new(first_name: nil)).to_not be_valid
    end
  end

end
