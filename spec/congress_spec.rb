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
end
