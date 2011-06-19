require 'congress/connection'
require 'congress/request'

module Congress
  class Client
    include Congress::Connection
    include Congress::Request

    # Fetch bills introduced bills and resolutions in Congress
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.bills
    def bills(options={})
      get('/api/v1/bills.json', options.merge(api_key))
    end

    # Fetch votes taken in Congress
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.votes
    def votes(options={})
      get('/api/v1/votes.json', options.merge(api_key))
    end

    # Fetch amendments to bills and resolutions offered in Congress
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.amendments
    def amendments(options={})
      get('/api/v1/amendments.json', options.merge(api_key))
    end

    # Fetch videos from the U.S. House of Representatives and from the White House
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.videos
    def videos(options={})
      get('/api/v1/videos.json', options.merge(api_key))
    end

    # Fetch updates from the floor of each chamber of Congress
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.floor_updates
    def floor_updates(options={})
      get('/api/v1/floor_updates.json', options.merge(api_key))
    end

    # Fetch upcoming scheduled committee hearings in the House and Senate
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.committee_hearings
    def committee_hearings(options={})
      get('/api/v1/committee_hearings.json', options.merge(api_key))
    end

    # Fetch links to various kinds of documents produced by agencies within Congress
    #
    # @return [Hashie::Rash]
    # @example
    #   Congress.key = YOUR_RTC_API_KEY
    #   Congress.documents
    def documents(options={})
      get('/api/v1/documents.json', options.merge(api_key))
    end

    private

    def api_key
      {:apikey => Congress.key}
    end

  end
end
