require 'helper'

describe Congress::Client do
  before do
    @client = Congress::Client.new
    Congress.configure do |config|
      config.key = "abc123"
    end
  end

  describe '#bills' do
    before do
      stub_get('/api/v1/bills.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('bills.json'))
    end

    it "should fetch bills introduced bills and resolutions in Congress" do
      bills = @client.bills
      a_get('/api/v1/bills.json?apikey=abc123').
        should have_been_made
      bills['count'].should == 17836
      bills['bills'].first.bill_id.should == "hres314-112"
    end
  end

  describe '#votes' do
    before do
      stub_get('/api/v1/votes.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('votes.json'))
    end

    it "should fetch votes taken in Congress" do
      votes = @client.votes
      a_get('/api/v1/votes.json?apikey=abc123').
        should have_been_made
      votes['count'].should == 5103
      votes['votes'].first.roll_id.should == "s91-2011"
    end
  end

  describe '#amendments' do
    before do
      stub_get('/api/v1/amendments.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('amendments.json'))
    end

    it "should fetch amendments to bills and resolutions offered in Congress" do
      amendments = @client.amendments
      a_get('/api/v1/amendments.json?apikey=abc123').
        should have_been_made
      amendments['count'].should == 6606
      amendments['amendments'].first.bill_id.should == "s679-112"
    end
  end

  describe '#videos' do
    before do
      stub_get('/api/v1/videos.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('videos.json'))
    end

    it "should fetch videos from the U.S. House of Representatives and from the White House" do
      videos = @client.videos
      a_get('/api/v1/videos.json?apikey=abc123').
        should have_been_made
      videos['count'].should == 1034
      videos['videos'].first.video_id.should == "whitehouse-1308389400-weekly-address-celebrating-fathers"
    end
  end

  describe '#floor_updates' do
    before do
      stub_get('/api/v1/floor_updates.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('floor_updates.json'))
    end

    it "should fetch updates from the floor of each chamber of Congress" do
      floor_updates = @client.floor_updates
      a_get('/api/v1/floor_updates.json?apikey=abc123').
        should have_been_made
      floor_updates['count'].should == 2183
      floor_updates['floor_updates'].first.chamber.should == "senate"
    end
  end

  describe '#committee_hearings' do
    before do
      stub_get('/api/v1/committee_hearings.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('committee_hearings.json'))
    end

    it "should fetch upcoming scheduled committee hearings in the House and Senate" do
      committee_hearings = @client.committee_hearings
      a_get('/api/v1/committee_hearings.json?apikey=abc123').
        should have_been_made
      committee_hearings['count'].should == 482
      committee_hearings['committee_hearings'].first.committee_id.should == "SSVA"
    end
  end

  describe '#documents' do
    before do
      stub_get('/api/v1/documents.json?apikey=abc123').
        to_return(:status => 200, :body => fixture('documents.json'))
    end

    it "should fetch links to various kinds of documents produced by agencies within Congress" do
      documents = @client.documents
      a_get('/api/v1/documents.json?apikey=abc123').
        should have_been_made
      documents['count'].should == 124
      documents['documents'].first.document_type.should == "whip_notice"
    end
  end

end
