source 'http://rubygems.org'

gem 'rake'

platforms :jruby do
  gem 'jruby-openssl', '~> 0.7'
end

group :development do
  gem 'json', :platforms => [:jruby, :ruby_18]
  gem 'kramdown'
  gem 'simplecov'
  gem 'yard'
end

group :test do
  gem 'rspec'
  gem 'webmock'
end

gemspec
