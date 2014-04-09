require 'rspec'
require 'stringio'

# Custom matcher to test text written to standard output and standard error
#
# @example
# expect { $stderr.puts "Some random error" }.to write(/Some.* error/).to(:stderr)
#
# @example
# expect { $stderr.puts "Some specific error" }.to write('Some specific error').to(:stderr)
#
# @note http://greyblake.com/blog/2012/12/14/custom-expectations-with-rspec/
RSpec::Matchers.define :write do |message|
  chain(:to) do |io|
    @io = io
  end

  match do |block|
    output =
      case io
      when :stdout then fake_stdout(&block)
      when :stderr then fake_stderr(&block)
      else fail("Allowed values for `to` are :stdout and :stderr, got `#{io.inspect}`")
      end

    case message
    when String then output.include? message
    when Regexp then output.match message
    else fail("Allowed types for write `message` are String or Regexp, got `#{message.class}`")
    end
  end

  description do
    %Q(write #{message.inspect} to #{@io})
  end

  def failure_message(to = 'to')
    %Q(expected #{to} #{description} but got #{@buffer.inspect})
  end

  failure_message_for_should do
    failure_message 'to'
  end

  failure_message_for_should_not do
    failure_message 'not to'
  end

  # Fake STDERR and return a string written to it.
  def fake_stderr
    original_stderr = $stderr
    $stderr = StringIO.new
    yield
    @buffer = $stderr.string
  ensure
    $stderr = original_stderr
  end

  # Fake STDOUT and return a string written to it.
  def fake_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    @buffer = $stdout.string
  ensure
    $stdout = original_stdout
  end

  # default IO is standard output
  def io
    @io ||= :stdout
  end
end
