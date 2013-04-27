source 'https://rubygems.org'

gem 'rake'

platforms :jruby do
  gem 'jruby-openssl', '~> 0.7'
end

group :development do
  gem 'kramdown'
  gem 'yard'
end

group :test do
  gem 'coveralls', :require => false
  gem 'json', :platforms => [:jruby, :ruby_18]
  gem 'rspec'
  gem 'simplecov', :require => false
  gem 'webmock'
end

gemspec
