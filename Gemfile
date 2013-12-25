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
  gem 'mime-types', '~> 1.25', :platforms => [:jruby, :ruby_18]
  gem 'rspec'
  gem 'simplecov', :require => false
  gem 'webmock'
end

platforms :rbx do
  gem 'rubinius-coverage', '~> 2.0'
  gem 'rubysl', '~> 2.0'
end

gemspec
