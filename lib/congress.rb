require 'congress/client'

module Congress
  extend self # rubocop:disable ModuleFunction
  attr_accessor :key

  def configure
    yield self
  end

  # Alias for Congress::Client.new
  #
  # @return [Congress::Client]
  def new(key = key)
    return @client if instance_variable_defined?(:@client) && @client.key == key
    @client = Congress::Client.new(key)
  end

  # Delegate to Congress::Client
  def method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  # @return [Boolean]
  def respond_to?(method, include_private = false) new.respond_to?(method, include_private) end if RUBY_VERSION < '1.9' # rubocop:disable SingleLineMethods

  # @return [Boolean]
  def respond_to_missing?(method_name, include_private = false) new.respond_to?(method_name, include_private) end if RUBY_VERSION >= '1.9' # rubocop:disable SingleLineMethods
end
