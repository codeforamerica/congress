unless ENV['CI']
  require 'simplecov'
  SimpleCov.start
end
require 'congress'
require 'rspec'
require 'webmock/rspec'

def a_get(path)
  a_request(:get, 'http://congress.api.sunlightfoundation.com' + path)
end

def stub_get(path)
  stub_request(:get, 'http://congress.api.sunlightfoundation.com' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
