require 'yaml'

require 'ngineer/commands'
require 'ngineer/configuration'
require 'ngineer/output'

module Ngineer

  def self.output
    STDOUT
  end

  def self.commands
    Ngineer::Commands.new(self.output)
  end

  def self.init(args = nil, options = nil)
    self.commands.init(args, options)
  end

  def self.link(args = nil, options = nil)
    self.commands.link(args, options)
  end

  def self.list(args = nil, options = nil)
    self.commands.list(args, options)
  end

  def self.nuke(args = nil, options = nil)
    self.commands.nuke(args, options)
  end

end