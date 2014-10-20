module PryBloodline
  class Configuration

    DEFAULT_LINE_PROC = proc do |_, _, _pry_|
      "[#{_pry_.input_array.size.to_s.bold}]"
    end

    DEFAULT_PATH_PROC = proc do |_, _, _pry_|
      _pry_.binding_stack.map.each_with_index do |b, index|
        if index.zero?
          "~"
        else
          Pry.view_clip(b.eval("self"))
        end
      end.join("/")
    end

    DEFAULT_SEPARATOR = "\u00BB"

    DEFAULTS = {
      name_color: :blue,
      line_proc: DEFAULT_LINE_PROC,
      line_color: :white,
      path_proc: DEFAULT_PATH_PROC,
      path_color: :white,
      separator: DEFAULT_SEPARATOR,
      separator_color: :red
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
