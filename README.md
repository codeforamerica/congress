# Ruby wrapper for the Real-Time Congress API

[![Gem Version](https://badge.fury.io/rb/congress.png)][gem]
[![Build Status](https://secure.travis-ci.org/codeforamerica/congress.png)][travis]
[![Dependency Status](https://gemnasium.com/codeforamerica/congress.png?travis)][gemnasium]
[![Code Climate](https://codeclimate.com/github/codeforamerica/congress.png)][codeclimate]
[gem]: https://rubygems.org/gems/congress
[travis]: http://travis-ci.org/codeforamerica/congress
[gemnasium]: https://gemnasium.com/codeforamerica/congress
[codeclimate]: https://codeclimate.com/github/codeforamerica/congress

The Real-Time Congress (RTC) API is a RESTful API over the artifacts of
Congress, in as close to real-time as possible.

## Installation
    gem install congress

## Documentation
[http://rdoc.info/gems/congress](http://rdoc.info/gems/congress)

## Usage Examples
    require 'rubygems'
    require 'congress'

    # An API key is required
    # You can obtain one from http://services.sunlightlabs.com/accounts/register/
    Congress.key = YOUR_RTC_API_KEY

    # Fetch bills introduced bills and resolutions in Congress
    puts Congress.bills

    # Fetch votes taken in Congress
    puts Congress.votes

    # Fetch amendments to bills and resolutions offered in Congress
    puts Congress.amendments

    # Fetch videos from the U.S. House of Representatives and from the White House
    puts Congress.videos

    # Fetch updates from the floor of each chamber of Congress
    puts Congress.floor_updates

    # Fetch upcoming scheduled committee hearings in the House and Senate
    puts Congress.committee_hearings

    # Fetch links to various kinds of documents produced by agencies within Congress
    puts Congress.documents

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help improve
this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by fixing [issues][]
* by reviewing patches

[issues]: https://github.com/codeforamerica/congress/issues

## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

## Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake spec`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake spec`. If your specs fail, return to step 5.
7. Run `open coverage/index.html`. If your changes are not completely covered
   by your tests, return to step 3.
8. Add documentation for your feature or bug fix.
9. Run `bundle exec rake yard`. If your changes are not 100% documented, go
   back to step 8.
10. Add, commit, and push your changes.
11. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## Supported Rubies
This library aims to support and is [tested against][travis] the following Ruby
implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
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
Copyright (c) 2011, Code for America. See [LICENSE][] for details.

[license]: https://github.com/codeforamerica/congress/blob/master/LICENSE.md

[![Code for America Tracker](http://stats.codeforamerica.org/codeforamerica/congress.png)](http://stats.codeforamerica.org/projects/congress)
