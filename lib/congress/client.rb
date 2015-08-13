require 'congress/connection'
require 'congress/request'
require 'geocoder'

module Congress
  class Client
    include Connection
    include Request
    attr_reader :key

    def initialize(key)
      @key = key
    end

    # Current legislators' names, IDs, biography, and social media.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.legislators
    def legislators(options = {})
      get('/legislators', options)
    end

    # Find representatives and senators for a latitude/longitude, zip, or address.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.legislators_locate('94107')
    #   client.legislators_locate(37.775, -122.418)
    #   client.legislators_locate('2169 Mission Street, San Francisco, CA 94110')
    def legislators_locate(*args)
      get('/legislators/locate', extract_location(args))
    end

    # Find congressional districts for a latitude/longitude, zip, or address.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.districts_locate('94107')
    #   client.districts_locate(37.775, -122.418)
    #   client.districts_locate('2169 Mission Street, San Francisco, CA 94110')
    def districts_locate(*args)
      get('/districts/locate', extract_location(args))
    end

    # Current committees, subcommittees, and their membership.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.committees
    def committees(options = {})
      get('/committees', options)
    end

    # Legislation in the House and Senate, back to 2009. Updated daily.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.bills
    def bills(options = {})
      get('/bills', options)
    end

    # Full text search over legislation.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.bills_search
    def bills_search(options = {})
      get('/bills/search', options)
    end

    # Roll call votes in Congress, back to 2009. Updated within minutes of votes.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.votes
    def votes(options = {})
      get('/votes', options)
    end

    # To-the-minute updates from the floor of the House and Senate.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.floor_updates
    def floor_updates(options = {})
      get('/floor_updates', options)
    end

    # Committee hearings in client. Updated as hearings are announced.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.hearings
    def hearings(options = {})
      get('/hearings', options)
    end

    # Bills scheduled for debate in the future, as announced by party leadership.
    #
    # @return [Hashie::Rash]
    # @example
    #   client.upcoming_bills
    def upcoming_bills(options = {})
      get('/upcoming_bills', options)
    end

  private

    def extract_location(args) # rubocop:disable AbcSize, MethodLength
      options = args.last.is_a?(::Hash) ? args.pop : {}
      case args.size
      when 1
        case args[0]
        when Integer, /\A[\d]{5}\Z/
          options.merge!(zip: to_zip_code(args[0]))
        when String
          placemark = Geocoder.search(args[0]).first
          options.merge!(latitude: placemark.latitude, longitude: placemark.longitude)
        end
      when 2
        options.merge!(latitude: args[0], longitude: args[1])
      end
      options
    end

    # Proper zip code from a number, adding leading zeroes if required
    # @param number [Integer] zip code as an integer
    # @return [String]
    def to_zip_code(number)
      format('%05d', number.to_i)
    end
  end
end
