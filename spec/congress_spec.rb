require 'helper'

describe Congress do
  describe ".new" do
    it "should return a Congress::Client" do
      Congress.new.should be_a Congress::Client
    end
  end

  describe ".configure" do
    it "should set 'name' and 'pass'" do
      Congress.configure do |c|
        c.key = "abc123"
      end
      Congress.key.should == "abc123"
    end
  end
end
