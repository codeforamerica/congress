# encoding: utf-8
require File.expand_path('../lib/congress/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'faraday_middleware', '~> 0.10.0'
  spec.add_dependency 'hashie', '~> 3.0'
  spec.add_dependency 'geocoder', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author        = 'Erik Michaels-Ober'
  spec.description   = 'Ruby wrapper for the Sunlight Congress API, a live JSON API for the people and work of Congress, provided by the Sunlight Foundation.'
  spec.email         = 'sferik@gmail.com'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.start_with?('spec/') }
  spec.homepage      = 'https://github.com/codeforamerica/congress'
  spec.licenses      = ['MIT']
  spec.name          = 'congress'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'
  spec.summary       = 'Ruby wrapper for the Sunlight Congress API'
  spec.version       = Congress::Version
end
