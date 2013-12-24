require 'faraday_middleware'

module Congress
  module Connection
    ENDPOINT = 'https://congress.api.sunlightfoundation.com'

    private

    def connection
      @connection ||= Faraday.new(:url => ENDPOINT) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Rashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
