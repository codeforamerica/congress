require 'congress/client'

module Congress
  class << self
    attr_accessor :key
    def configure
      yield self
    end

    # Alias for Congress::Client.new
    #
    # @return [Congress::Client]
    def new
      Congress::Client.new
    end

    # Delegate to Congress::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
