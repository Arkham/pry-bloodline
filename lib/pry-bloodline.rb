require 'pry'
require 'readline'
require 'colorize'

require 'pry-bloodline/version'
require 'pry-bloodline/configuration'
require 'pry-bloodline/railtie' if defined?(Rails)

module PryBloodline
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    Configuration::DEFAULT_METHODS.each do |sym|
      define_method sym do
        configuration.send(sym)
      end
    end

    def colored_prompt?
      Readline::VERSION !~ /EditLine/
    end

    def color_enabled?
      Pry.color && colored_prompt?
    end

    def setup!(name = "pry")
      colorize = proc do |message|
        if PryBloodline.color_enabled?
          message
        else
          message.uncolorize
        end
      end

      prompt_without_separator = proc do |object, level, _pry_|
        "#{line_proc.(object, level, _pry_)} #{name_proc.(name)} #{path_proc.(object, level, _pry_)}"
      end

      prompt = proc do |object, level, _pry_|
        colorize.("#{prompt_without_separator.(object, level, _pry_)} #{separator_proc.()}  ")
      end

      multiline_prompt = proc do |object, level, _pry_|
        padding = ' ' * prompt_without_separator.(object, level, _pry_).uncolorize.size
        colorize.("#{padding} #{separator_proc.()}  ")
      end

      Pry.config.prompt = [ prompt, multiline_prompt ]
    end
  end
end
