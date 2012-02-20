module Ngineer

  class Output
  
    def output
      @output ||= []
    end
  
    def puts(object)
      self.output << object
    end
    
    def write(object)
      self.output << object
    end
    
    def debug
      self.output.each do |object|
        STDOUT.puts object
      end
    end
  
  end

end