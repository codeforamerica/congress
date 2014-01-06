require 'helper'

describe Congress do
  before do
    Congress.key = 'abc1234'
  end
  describe '.new' do
    it 'returns a Congress::Client' do
      expect(Congress.new).to be_a Congress::Client
    end
    it 'sets key with a blog' do
      Congress.new do |c|
        c.key = 'abc123'
      end
      expect(Congress.key).to eq('abc123')
    end
    context 'with no api key' do
      it 'raises an argument error' do
        expect { Congress.new(nil) }.to raise_error ArgumentError
      end
    end
  end

  describe '.method_missing' do
    before do
      stub_get('/legislators').
        to_return(:status => 200, :body => fixture('legislators.json'))
    end
    it 'delegates to an instance of Congress::Client' do
      client = Congress.new
      expect(client).to receive(:legislators)
      Congress.legislators
    end
  end
end
