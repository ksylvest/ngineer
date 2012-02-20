require 'spec_helper'

describe Ngineer::Output do

  let (:output) { Ngineer::Output.new }

  describe "#puts" do
    it "should append to output" do
      expect {
        output.puts "example [success]"
        output.puts "example [failure]"
      }.to change output.output, :count
    end
  end

end