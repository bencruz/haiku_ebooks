require 'spec_helper'
require_relative '../lib/string.rb'

describe String do
  describe ".syllable_count" do
    it "should know it's count" do
      "alpha".syllable_count.should == 2
    end

    it "should know the count of multiple words" do
      "alpha tango bravo nine".syllable_count.should == 7
    end

    it "should handle weird white space" do
      " white   space   ".syllable_count.should == 2
    end

    #maybe I should add poopies to the dictionary?
    #it's kind of absurd that a twitter bot doesn't know about poop jokes
    it "should deal with words that it doesn't know" do
      "poopies".syllable_count.should == nil
    end
  end

  describe ".haiku?" do
    it "should know that 17 is the number" do
      "one two three".haiku?.should == false
    end

    it "should know if a string is a haiku" do
      haiku = "this is a haiku written in order to test that i know haiku"
      haiku.haiku?.should == true
    end

    it "should know that a string is not a haiku" do
      not_haiku = "i am not a haiku though i am made of seven teen syllables"
      not_haiku.haiku?.should == false
    end
  end
end
