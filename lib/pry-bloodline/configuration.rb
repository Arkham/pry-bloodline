module PryBloodline
  class Configuration

    def self.configuration
      PryBloodline.configuration
    end

    def self.c
      configuration
    end

    DEFAULT_LINE_PROC = proc do |object, level, _pry_|
      "[#{_pry_.input_array.size.to_s.bold}]".colorize(c.line_color)
    end

    DEFAULT_PATH_PROC = proc do |object, level, _pry_|
      _pry_.binding_stack.map.each_with_index do |b, index|
        if index.zero?
          "~"
        else
          Pry.view_clip(b.eval("self"))
        end
      end.join("/").colorize(c.path_color)
    end

    DEFAULT_SEPARATOR_PROC = proc do
      c.separator.colorize(c.separator_color)
    end

    DEFAULT_NAME_PROC = proc do
      c.name.colorize(c.name_color)
    end

    DEFAULTS = {
      name: "pry",
      line_color: :light_black,
      name_color: :green,
      path_color: :light_blue,
      separator: "\u00BB",
      separator_color: :light_green,
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
