#! /usr/bin/env ruby -S rspec
require 'spec_helper'

describe "the grep function" do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("grep").should == "function_grep"
  end

  it "should raise a ParseError if there is less than 1 arguments" do
    lambda { @scope.function_grep([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should grep contents from an array" do
    result = @scope.function_grep([["aaabbb","bbbccc","dddeee"], "bbb"])
    result.should(eq(["aaabbb","bbbccc"]))
  end

end
