require 'helper'

describe Congress::Client do
  before do
    @client = Congress::Client.new
    Congress.configure do |config|
      config.key = "abc123"
    end
  end

  describe '#legislators' do
    before do
      stub_get('/legislators?apikey=abc123').
        to_return(:status => 200, :body => fixture('legislators.json'))
    end
    it "fetches current legislators' names, IDs, biography, and social media" do
      legislators = @client.legislators
      a_get('/legislators?apikey=abc123').
        should have_been_made
      legislators['count'].should == 539
      legislators['results'].first.bioguide_id.should == "K000385"
    end
  end

  describe '#legislators_locate' do
    context "with a zip code passed" do
      before do
        stub_get('/legislators/locate?apikey=abc123&zip=94107').
          to_return(:status => 200, :body => fixture('legislators_locate.json'))
      end
      it "fetches representatives and senators for a latitude/longitude or zip" do
        legislators_locate = @client.legislators_locate(94107)
        a_get('/legislators/locate?apikey=abc123&zip=94107').
          should have_been_made
        legislators_locate['count'].should == 3
        legislators_locate['results'].first.bioguide_id.should == "P000197"
      end
    end
    context "with a latitude and longitude passed" do
      before do
        stub_get('/legislators/locate?apikey=abc123&latitude=37.775&longitude=-122.418').
          to_return(:status => 200, :body => fixture('legislators_locate.json'))
      end
      it "fetches representatives and senators for a latitude/longitude or zip" do
        legislators_locate = @client.legislators_locate(37.775, -122.418)
        a_get('/legislators/locate?apikey=abc123&latitude=37.775&longitude=-122.418').
          should have_been_made
        legislators_locate['count'].should == 3
        legislators_locate['results'].first.bioguide_id.should == "P000197"
      end
    end
    context "with no arguments passed" do
      it "raises an argument error" do
        lambda {
          @client.legislators_locate
        }.should raise_error ArgumentError
      end
    end
  end

  describe '#districts_locate' do
    context "with a zip code passed" do
      before do
        stub_get('/districts/locate?apikey=abc123&zip=94107').
          to_return(:status => 200, :body => fixture('districts_locate.json'))
      end
      it "fetches congressional districts for a latitude/longitude or zip" do
        districts_locate = @client.districts_locate(94107)
        a_get('/districts/locate?apikey=abc123&zip=94107').
          should have_been_made
        districts_locate['count'].should == 1
        districts_locate['results'].first.district.should == 12
      end
    end
    context "with a latitude and longitude passed" do
      before do
        stub_get('/districts/locate?apikey=abc123&latitude=37.775&longitude=-122.418').
          to_return(:status => 200, :body => fixture('districts_locate.json'))
      end
      it "fetches congressional districts for a latitude/longitude or zip" do
        districts_locate = @client.districts_locate(37.775, -122.418)
        a_get('/districts/locate?apikey=abc123&latitude=37.775&longitude=-122.418').
          should have_been_made
        districts_locate['count'].should == 1
        districts_locate['results'].first.district.should == 12
      end
    end
    context "with no arguments passed" do
      it "raises an argument error" do
        lambda {
          @client.districts_locate
        }.should raise_error ArgumentError
      end
    end
  end

  describe '#committees' do
    before do
      stub_get('/committees?apikey=abc123').
        to_return(:status => 200, :body => fixture('committees.json'))
    end
    it "fetches legislation in the House and Senate" do
      committees = @client.committees
      a_get('/committees?apikey=abc123').
        should have_been_made
      committees['count'].should == 120
      committees['results'].first.chamber.should == "senate"
    end
  end

  describe '#bills' do
    before do
      stub_get('/bills?apikey=abc123').
        to_return(:status => 200, :body => fixture('bills.json'))
    end
    it "fetches legislation in the House and Senate" do
      bills = @client.bills
      a_get('/bills?apikey=abc123').
        should have_been_made
      bills['count'].should == 28614
      bills['results'].first.bill_id.should == "s730-113"
    end
  end

  describe '#bills_search' do
    before do
      stub_get('/bills/search?apikey=abc123').
        to_return(:status => 200, :body => fixture('bills_search.json'))
    end
    it "fetches legislation" do
      bills_search = @client.bills_search
      a_get('/bills/search?apikey=abc123').
        should have_been_made
      bills_search['count'].should == 28614
      bills_search['results'].first.bill_type.should == "hr"
    end
  end

  describe '#votes' do
    before do
      stub_get('/votes?apikey=abc123').
        to_return(:status => 200, :body => fixture('votes.json'))
    end
    it "fetches roll call votes in Congress" do
      votes = @client.votes
      a_get('/votes?apikey=abc123').
        should have_been_made
      votes['count'].should == 4647
      votes['results'].first.roll_id.should == "h106-2013"
    end
  end

  describe '#floor_updates' do
    before do
      stub_get('/floor_updates?apikey=abc123').
        to_return(:status => 200, :body => fixture('floor_updates.json'))
    end
    it "fetches to-the-minute updates from the floor of the House and Senate" do
      floor_updates = @client.floor_updates
      a_get('/floor_updates?apikey=abc123').
        should have_been_made
      floor_updates['count'].should == 3066
      floor_updates['results'].first.chamber.should == "senate"
    end
  end

  describe '#hearings' do
    before do
      stub_get('/hearings?apikey=abc123').
        to_return(:status => 200, :body => fixture('hearings.json'))
    end
    it "fetches committee hearings in Congress" do
      hearings = @client.hearings
      a_get('/hearings?apikey=abc123').
        should have_been_made
      hearings['count'].should == 1279
      hearings['results'].first.committee_id.should == "SSFR"
    end
  end

  describe '#upcoming_bills' do
    before do
      stub_get('/upcoming_bills?apikey=abc123').
        to_return(:status => 200, :body => fixture('upcoming_bills.json'))
    end
    it "fetches committee hearings in Congress" do
      upcoming_bills = @client.upcoming_bills
      a_get('/upcoming_bills?apikey=abc123').
        should have_been_made
      upcoming_bills['count'].should == 9
      upcoming_bills['results'].first.bill_id.should == "s3457-113"
    end
  end

end
