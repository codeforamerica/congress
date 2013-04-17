# encoding: utf-8
require File.expand_path('../lib/congress/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday', '~> 0.7'
  gem.add_dependency 'faraday_middleware', '~> 0.7'
  gem.add_dependency 'hashie', '~> 2.0'
  gem.add_dependency 'rash', '~> 0.4'
  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.author      = "Erik Michaels-Ober"
  gem.description = %q{Ruby wrapper for the Real-Time Congress API. The Real-Time Congress API is a RESTful API over the artifacts of Congress, in as close to real-time as possible.}
  gem.email       = 'sferik@gmail.com'
  gem.files       = `git ls-files`.split("\n")
  gem.homepage    = 'https://github.com/codeforamerica/congress'
  gem.name        = 'congress'
  gem.require_paths = ['lib']
  gem.summary     = %q{Ruby wrapper for the Real-Time Congress API}
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version     = Congress::VERSION
end
