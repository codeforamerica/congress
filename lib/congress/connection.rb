require 'faraday_middleware'

module Congress
  module Connection
    ENDPOINT = 'https://congress.api.sunlightfoundation.com'.freeze

  private

    def connection
      @connection ||= create_connection
    end

    def create_connection
      Faraday.new(url: ENDPOINT) do |connection|
        middlewares.each { |middleware| connection.use(middleware) }
        connection.adapter(Faraday.default_adapter)
      end
    end

    def middlewares
      [
        Faraday::Request::UrlEncoded,
        Faraday::Response::RaiseError,
        Faraday::Response::Mashify,
        Faraday::Response::ParseJson,
      ]
    end
  end
end
