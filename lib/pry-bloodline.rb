require 'pry'
require 'readline'
require 'colorize'

require 'pry-bloodline/version'
require 'pry-bloodline/configuration'
require 'pry-bloodline/setup'
require 'pry-bloodline/railtie' if defined?(Rails)

module PryBloodline
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def setup!
      Setup.new(configuration).setup!
    end
  end
end
