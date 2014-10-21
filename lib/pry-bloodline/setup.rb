module PryBloodline
  class Setup
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def setup!
      Pry.config.prompt = [ prompt, multiline_prompt ]
    end

    def prompt
      proc do |object, level, _pry_|
        colorize.("#{prompt_without_separator.(object, level, _pry_)} #{separator_proc.()}  ")
      end
    end

    def multiline_prompt
      proc do |object, level, _pry_|
        padding = ' ' * prompt_without_separator.(object, level, _pry_).uncolorize.size
        colorize.("#{padding} #{separator_proc.()}  ")
      end
    end

  private

    def prompt_without_separator
      proc do |object, level, _pry_|
        "#{line_proc.(object, level, _pry_)} #{name_proc.()} #{path_proc.(object, level, _pry_)}"
      end
    end

    def colorize
      proc do |message|
        if color_enabled?
          message
        else
          message.uncolorize
        end
      end
    end

    def color_enabled?
      Pry.color && colored_prompt?
    end

    def colored_prompt?
      Readline::VERSION !~ /EditLine/
    end

    def method_missing(method_sym, *args, &block)
      if configuration.respond_to? method_sym
        configuration.send(method_sym, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_sym)
      configuration.respond_to? method_sym
    end
  end
end
