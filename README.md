# Ruby wrapper for the Sunlight Congress API

[![Gem Version](http://img.shields.io/gem/v/congress.svg)][gem]
[![Build Status](http://img.shields.io/travis/codeforamerica/congress.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/codeforamerica/congress.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/codeforamerica/congress.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/codeforamerica/congress.svg)][coveralls]

[gem]: https://rubygems.org/gems/congress
[travis]: http://travis-ci.org/codeforamerica/congress
[gemnasium]: https://gemnasium.com/codeforamerica/congress
[codeclimate]: https://codeclimate.com/github/codeforamerica/congress
[coveralls]: https://coveralls.io/r/codeforamerica/congress

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
Congress.key = YOUR_SUNLIGHT_API_KEY
```

###### Fetch current legislators' names, IDs, biography, and social media
```ruby
# default is 20 per page
Congress.legislators

# per-page option can be passed in
Congress.legislators(per_page: "all")
```


###### Fetch representatives and senators for a latitude/longitude or zip code
```ruby
Congress.legislators_locate(37.775, -122.418)
Congress.legislators_locate(94107)
```

###### Fetch congressional districts for a latitude/longitude or zip code
```ruby
Congress.districts_locate(37.775, -122.418)
Congress.districts_locate(94107)
```

###### Fetch current committees, subcommittees, and their membership
```ruby
Congress.committees
```

###### Fetch legislation in the House and Senate
```ruby
Congress.bills
```

###### Fetch legislation related to health care
```ruby
Congress.bills_search(:query => "health care")
```

###### Fetch roll call votes in Congress
```ruby
Congress.votes
```

###### Fetch to-the-minute updates from the floor of the House and Senate
```ruby
Congress.floor_updates
```

###### Fetch committee hearings in Congress
```ruby
Congress.hearings
```

###### Fetch bills scheduled for debate in the future, as announced by party leadership
```ruby
Congress.upcoming_bills
```

## Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.0
* [JRuby][]
* [Rubinius][]

[jruby]: http://www.jruby.org/
[rubinius]: http://rubini.us/

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
Copyright (c) 2011-2014, Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/congress/blob/master/LICENSE.md
