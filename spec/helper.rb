$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'congress'
require 'rspec'
require 'webmock/rspec'

def a_get(path)
  a_request(:get, 'http://api.realtimecongress.org' + path)
end

def stub_get(path)
  stub_request(:get, 'http://api.realtimecongress.org' + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
