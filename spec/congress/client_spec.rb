require 'helper'

describe Congress::Client do
  let(:gmaps_api) { 'http://maps.googleapis.com/maps/api/geocode/json?address=2169%20Mission%20Street,%20San%20Francisco,%20CA%2094110&language=en&sensor=false' }

  before do
    @client = Congress::Client.new('abc123')
  end

  describe '#legislators' do
    before do
      stub_get('/legislators')
        .to_return(status: 200, body: fixture('legislators.json'))
    end
    it "fetches current legislators' names, IDs, biography, and social media" do
      legislators = @client.legislators
      expect(a_get('/legislators').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(legislators['count']).to eq(539)
      expect(legislators['results'].first.bioguide_id).to eq('K000385')
    end
  end

  describe '#legislators_locate' do
    context 'with a zip code passed' do
      before do
        stub_get('/legislators/locate').with(query: {zip: '06511'})
          .to_return(status: 200, body: fixture('legislators_locate.json'))
        stub_get('/legislators/locate').with(query: {zip: '94107'})
          .to_return(status: 200, body: fixture('legislators_locate.json'))
      end
      it 'fetches representatives and senators for a zip code' do
        legislators_locate = @client.legislators_locate(94_107)
        expect(a_get('/legislators/locate?zip=94107').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(legislators_locate['count']).to eq(3)
        expect(legislators_locate['results'].first.bioguide_id).to eq('P000197')
      end
      context 'zip code with leading zeroes' do
        it 'pads with leading zeroes' do
          @client.legislators_locate(6511)
          expect(a_get('/legislators/locate?zip=06511').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        end
      end
      context 'zip code as string' do
        it 'interprets five-digit strings as zip codes' do
          @client.legislators_locate('06511')
          expect(a_get('/legislators/locate?zip=06511').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        end
      end
    end
    context 'with a latitude and longitude passed' do
      before do
        stub_get('/legislators/locate?latitude=37.775&longitude=-122.418')
          .to_return(status: 200, body: fixture('legislators_locate.json'))
      end
      it 'fetches representatives and senators for a latitude/longitude pair' do
        legislators_locate = @client.legislators_locate(37.775, -122.418)
        expect(a_get('/legislators/locate?latitude=37.775&longitude=-122.418').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(legislators_locate['count']).to eq(3)
        expect(legislators_locate['results'].first.bioguide_id).to eq('P000197')
      end
    end
    context 'with an address passed' do
      before do
        stub_get('/legislators/locate?latitude=37.775&longitude=-122.418')
          .to_return(status: 200, body: fixture('legislators_locate.json'))
        stub_request(:get, gmaps_api).to_return(status: 200, body: fixture('google_geocoding.json'))
      end
      it 'fetches representatives and senators for an address' do
        legislators_locate = @client.legislators_locate('2169 Mission Street, San Francisco, CA 94110')
        expect(a_request(:get, gmaps_api)).to have_been_made
        expect(a_get('/legislators/locate?latitude=37.775&longitude=-122.418').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(legislators_locate['count']).to eq(3)
        expect(legislators_locate['results'].first.bioguide_id).to eq('P000197')
      end
    end
  end

  describe '#districts_locate' do
    context 'with a zip code passed' do
      before do
        stub_get('/districts/locate?zip=94107')
          .to_return(status: 200, body: fixture('districts_locate.json'))
      end
      it 'fetches congressional districts for a zip code' do
        districts_locate = @client.districts_locate(94_107)
        expect(a_get('/districts/locate?zip=94107').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(districts_locate['count']).to eq(1)
        expect(districts_locate['results'].first.district).to eq(12)
      end
    end
    context 'with a latitude and longitude passed' do
      before do
        stub_get('/districts/locate?latitude=37.775&longitude=-122.418')
          .to_return(status: 200, body: fixture('districts_locate.json'))
      end
      it 'fetches congressional districts for a latitude/longitude pair' do
        districts_locate = @client.districts_locate(37.775, -122.418)
        expect(a_get('/districts/locate?latitude=37.775&longitude=-122.418').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(districts_locate['count']).to eq(1)
        expect(districts_locate['results'].first.district).to eq(12)
      end
    end
    context 'with an address passed' do
      before do
        stub_get('/districts/locate?latitude=37.775&longitude=-122.418')
          .to_return(status: 200, body: fixture('districts_locate.json'))
        stub_request(:get, gmaps_api).to_return(status: 200, body: fixture('google_geocoding.json'))
      end
      it 'fetches congressional districts for an address' do
        districts_locate = @client.districts_locate('2169 Mission Street, San Francisco, CA 94110')
        expect(a_request(:get, gmaps_api)).to have_been_made
        expect(a_get('/districts/locate?latitude=37.775&longitude=-122.418').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
        expect(districts_locate['count']).to eq(1)
        expect(districts_locate['results'].first.district).to eq(12)
      end
    end
  end

  describe '#committees' do
    before do
      stub_get('/committees')
        .to_return(status: 200, body: fixture('committees.json'))
    end
    it 'fetches current committees, subcommittees, and their membership' do
      committees = @client.committees
      expect(a_get('/committees').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(committees['count']).to eq(120)
      expect(committees['results'].first.chamber).to eq('senate')
    end
  end

  describe '#bills' do
    before do
      stub_get('/bills')
        .to_return(status: 200, body: fixture('bills.json'))
    end
    it 'fetches legislation in the House and Senate' do
      bills = @client.bills
      expect(a_get('/bills').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(bills['count']).to eq(28_614)
      expect(bills['results'].first.bill_id).to eq('s730-113')
    end
  end

  describe '#bills_search' do
    before do
      stub_get('/bills/search')
        .to_return(status: 200, body: fixture('bills_search.json'))
    end
    it 'fetches legislation' do
      bills_search = @client.bills_search
      expect(a_get('/bills/search').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(bills_search['count']).to eq(28_614)
      expect(bills_search['results'].first.bill_type).to eq('hr')
    end
  end

  describe '#votes' do
    before do
      stub_get('/votes')
        .to_return(status: 200, body: fixture('votes.json'))
    end
    it 'fetches roll call votes in Congress' do
      votes = @client.votes
      expect(a_get('/votes').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(votes['count']).to eq(4647)
      expect(votes['results'].first.roll_id).to eq('h106-2013')
    end
  end

  describe '#floor_updates' do
    before do
      stub_get('/floor_updates')
        .to_return(status: 200, body: fixture('floor_updates.json'))
    end
    it 'fetches to-the-minute updates from the floor of the House and Senate' do
      floor_updates = @client.floor_updates
      expect(a_get('/floor_updates').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(floor_updates['count']).to eq(3066)
      expect(floor_updates['results'].first.chamber).to eq('senate')
    end
  end

  describe '#hearings' do
    before do
      stub_get('/hearings')
        .to_return(status: 200, body: fixture('hearings.json'))
    end
    it 'fetches committee hearings in Congress' do
      hearings = @client.hearings
      expect(a_get('/hearings').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(hearings['count']).to eq(1279)
      expect(hearings['results'].first.committee_id).to eq('SSFR')
    end
  end

  describe '#upcoming_bills' do
    before do
      stub_get('/upcoming_bills')
        .to_return(status: 200, body: fixture('upcoming_bills.json'))
    end
    it 'fetches bills scheduled for debate in the future, as announced by party leadership' do
      upcoming_bills = @client.upcoming_bills
      expect(a_get('/upcoming_bills').with(headers: {'X-APIKEY' => 'abc123'})).to have_been_made
      expect(upcoming_bills['count']).to eq(9)
      expect(upcoming_bills['results'].first.bill_id).to eq('s3457-113')
    end
  end

end
