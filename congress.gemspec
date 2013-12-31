# encoding: utf-8
require File.expand_path('../lib/congress/version', __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency 'faraday', '~> 0.8.7'
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'rash', '~> 0.4'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.author        = 'Erik Michaels-Ober'
  spec.cert_chain    = ['certs/sferik.pem']
  spec.description   = %q{Ruby wrapper for the Sunlight Congress API, a live JSON API for the people and work of Congress, provided by the Sunlight Foundation.}
  spec.email         = 'sferik@gmail.com'
  spec.files         = `git ls-files`.split("\n")
  spec.homepage      = 'https://github.com/codeforamerica/congress'
  spec.licenses      = ['MIT']
  spec.name          = 'congress'
  spec.require_paths = ['lib']
  spec.signing_key   = File.expand_path('~/.gem/private_key.pem') if $PROGRAM_NAME =~ /gem\z/
  spec.summary       = %q{Ruby wrapper for the Sunlight Congress API}
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.version       = Congress::VERSION
end
