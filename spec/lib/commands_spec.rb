require 'spec_helper'

describe Ngineer::Commands do

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