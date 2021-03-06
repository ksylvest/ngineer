module Ngineer

  class Commands

    def initialize(output)
      @output = output
    end
    
    def init(args = nil, options = nil)
    end

    def list(args = nil, options = nil)
      Ngineeer::Configuration.shared.settings

      if config and config[:applications]
        config[:applications].each do |application|
          @output.puts "[#{self.colorize("FAILURE", :r)}]"
          @output.puts "[#{self.colorize("SUCCESS", :g)}]"
        end
      end
    end

    def link(args = nil, options = nil)
      Ngineeer::Configuration.shared.add(Identifier.generate, "localhost", 8000)
    end
    
    def nuke(args = nil, options = nil)
    end

  protected

    def colorize(text, color, set = "\e[0m")
      color = case color
        when :r then "\e[31m"
        when :g then "\e[32m"
        when :y then "\e[33m"
        when :b then "\e[34m"
        when :p then "\e[35m"
        when :t then "\e[36m"
        when :g then "\e[37m"
        else color
      end

      "#{color}#{text}#{set}"
    end

  end

end