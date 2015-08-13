# Ruby wrapper for the Sunlight Congress API

[![Gem Version](https://badge.fury.io/rb/congress.svg)][gem]
[![Build Status](https://travis-ci.org/codeforamerica/congress.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/codeforamerica/congress.svg)][gemnasium]
[![Code Climate](https://codeclimate.com/github/codeforamerica/congress/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/codeforamerica/congress/badge.svg?branch=master&service=github)][coveralls]

[gem]: https://rubygems.org/gems/congress
[travis]: https://travis-ci.org/codeforamerica/congress
[gemnasium]: https://gemnasium.com/codeforamerica/congress
[codeclimate]: https://codeclimate.com/github/codeforamerica/congress
[coveralls]: https://coveralls.io/github/codeforamerica/congress?branch=master

The Sunlight Congress API is a live JSON API for the people and work of
Congress, provided by the Sunlight Foundation.

## Installation
    gem install congress

## Documentation
[http://rdoc.info/gems/congress][documentation]
[documentation]: http://rdoc.info/gems/congress

## Authentication
All requests to the Congress API require a Sunlight API key. An API key is
[free to register][register] and has no usage limits.

[register]: http://services.sunlightlabs.com/accounts/register/

## Usage Examples
###### Setup
```ruby
require 'congress'
client = Congress::Client.new(YOUR_SUNLIGHT_API_KEY)
```

###### Fetch current legislators' names, IDs, biography, and social media
```ruby
client.legislators
```

###### Fetch representatives and senators for a latitude/longitude or zip code
```ruby
client.legislators_locate(37.775, -122.418)
client.legislators_locate('94107')
```

###### Fetch congressional districts for a latitude/longitude or zip code
```ruby
client.districts_locate(37.775, -122.418)
client.districts_locate('94107')
```

###### Fetch current committees, subcommittees, and their membership
```ruby
client.committees
```

###### Fetch legislation in the House and Senate
```ruby
client.bills
```

###### Fetch legislation related to health care
```ruby
client.bills_search(:query => "health care")
```

###### Fetch roll call votes in Congress
```ruby
client.votes
```

###### Fetch to-the-minute updates from the floor of the House and Senate
```ruby
client.floor_updates
```

###### Fetch committee hearings in Congress
```ruby
client.hearings
```

###### Fetch bills scheduled for debate in the future, as announced by party leadership
```ruby
client.upcoming_bills
```

## Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1
* Ruby 2.2
* JRuby 1.7
* JRuby 9.0.0.0

If something doesn't work on one of these interpreters, it should be considered
a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## Copyright
Copyright (c) 2011-2015, Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/congress/blob/master/LICENSE.md
