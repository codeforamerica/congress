require 'helper'

describe Congress do
  describe '.new' do
    it 'returns a Congress::Client' do
      expect(Congress.new).to be_a Congress::Client
    end
  end

  describe '.configure' do
    it "sets 'name' and 'pass'" do
      Congress.configure do |c|
        c.key = 'abc123'
      end
      expect(Congress.key).to eq('abc123')
    end
  end

  describe '.method_missing' do
    before do
      stub_get('/legislators').
        to_return(:status => 200, :body => fixture('legislators.json'))
    end
    it 'delegates to an instance of Congress::Client' do
      Congress.key = 'abc123'
      client = Congress.new
      expect(client).to receive(:legislators)
      Congress.legislators
    end
  end
end
