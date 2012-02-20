require 'spec_helper'

describe Ngineer::Settings do

  let (:settings) { Ngineer::Settings.new }
  let (:config) { nil }
  let (:nginx) { Ngineer::Output.new }


  describe "PATH" do
    it "should be an absolute path" do
      path = Ngineer::Settings::PATH
      path.should be_an_instance_of String
      path.should_not match '~'
    end
  end

  describe "#flush!" do
    it "should flush settings" do
      settings.stub!(:config).and_return(config)
      settings.stub!(:nginx).and_return(nginx)

      applications = []
      applications << { identifier: "alpha", host: "//alpha", port: 4040 }
      applications << { identifier: "omega", host: "//omega", port: 8080 }

      settings.settings = {}
      settings.settings[:applications] = applications

      settings.flush!

      config.output.should_not be_empty
      nginx.output.should_not be_empty
    end
  end

  describe "#reset!" do
    it "should reset settings" do
      settings.reset!
    end
  end

  describe "#config" do
    it "should return a file" do
      settings.send(:config).should be_an_instance_of File
    end
  end

  describe "#nginx" do
    it "should return a file" do
      settings.send(:nginx).should be_an_instance_of File
    end
  end

end