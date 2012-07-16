module Ngineer

  class Configuration

    PATH = File.expand_path "~/.ngineer"

    attr_accessor :settings
    
    def self.shared
      @@configuration ||= Ngineer::Configuration.new
    end

    def initialize
      self.settings = YAML::load(self.settings)
      self.settings[:applications] ||= []
    end

    def flush!
      self.config.puts YAML::dump(self.settings)

      self.settings[:applications].each do |application|
        self.nginx.puts "# #{application[:host]}"
        self.nginx.puts
        self.nginx.puts "upstream #{application[:identifier]}"
        self.nginx.puts "{"
        self.nginx.puts "  server localhost:#{application[:port]};"
        self.nginx.puts "}"
        self.nginx.puts
        self.nginx.puts "server"
        self.nginx.puts "{"
        self.nginx.puts "  listen 80;"
        self.nginx.puts "  location /"
        self.nginx.puts "  {"
        self.nginx.puts "    proxy_pass http://#{application[:identifier]}"
        self.nginx.puts "    proxy_set_header Host $host;"
        self.nginx.puts "    proxy_set_header X-Real-IP $remote_addr;"
        self.nginx.puts "    proxy_set_header X-Forward-For $remote_addr;"
        self.nginx.puts "  }"
        self.nginx.puts "}"
      end
    end
    
    def add(identifier, host, port)
      self.settings[:applications] << { identifier: identifier, host: host, port: port }
    end

  protected

    def config
      Dir.mkdir PATH unless Dir.exists? PATH
      @config ||= File.open "#{PATH}/config.yml", 'w+'
    end

    def nginx
      Dir.mkdir PATH unless Dir.exists? PATH
      @nging ||= File.open "#{PATH}/nginx.conf", 'w+'
    end

  end

end