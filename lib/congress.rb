require 'congress/client'

module Congress
  class << self
    attr_accessor :key
    def configure
      yield self
    end
  end

  # Alias for Congress::Client.new
  #
  # @return [Congress::Client]
  def self.new
    Congress::Client.new
  end

  # Delegate to Congress::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private=false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
