module PryBloodline
  class Configuration
    def self.configuration
      PryBloodline.configuration
    end

    DEFAULT_LINE_PROC = proc do |_, _, _pry_|
      "[#{_pry_.input_array.size.to_s.bold}]".colorize(configuration.line_color)
    end

    DEFAULT_NAME_PROC = proc do |name|
      name.colorize(configuration.name_color)
    end

    DEFAULT_PATH_PROC = proc do |_, _, _pry_|
      _pry_.binding_stack.map.each_with_index do |b, index|
        if index.zero?
          "~"
        else
          Pry.view_clip(b.eval("self"))
        end
      end.join("/").colorize(configuration.path_color)
    end

    DEFAULT_SEPARATOR_PROC = proc do
      configuration.separator.colorize(configuration.separator_color)
    end

    DEFAULT_SEPARATOR = "\u00BB"

    DEFAULTS = {
      line_color: :white,
      name_color: :blue,
      path_color: :white,
      separator_color: :red,

      separator: DEFAULT_SEPARATOR,

      name_proc: DEFAULT_NAME_PROC,
      line_proc: DEFAULT_LINE_PROC,
      path_proc: DEFAULT_PATH_PROC,
      separator_proc: DEFAULT_SEPARATOR_PROC,
    }.freeze

    DEFAULT_METHODS = DEFAULTS.keys

    attr_accessor *DEFAULT_METHODS

    def initialize
      DEFAULTS.each do |sym, value|
        self.send("#{sym}=", value)
      end
    end
  end
end
