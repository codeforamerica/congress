# encoding: utf-8
require File.expand_path('../lib/congress/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'faraday', '~> 0.8.7'
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'rash', '~> 0.4'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author        = "Erik Michaels-Ober"
  spec.description   = %q{Ruby wrapper for the Real-Time Congress API. The Real-Time Congress API is a RESTful API over the artifacts of Congress, in as close to real-time as possible.}
  spec.email         = 'sferik@gmail.com'
  spec.files         = `git ls-files`.split("\n")
  spec.homepage      = 'https://github.com/codeforamerica/congress'
  spec.name          = 'congress'
  spec.require_paths = ['lib']
  spec.summary       = %q{Ruby wrapper for the Real-Time Congress API}
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.version       = Congress::VERSION
end
