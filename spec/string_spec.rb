require 'spec_helper'

describe String do

	describe ".syllable_count" do
		it "should know it's count" do
			"alpha".syllable_count.should == 2
		end

		it "should know the count of multiple words" do
			"alpha tango bravo nine".syllable_count.should == 7
		end

    it "should handle weird white space" do
      " white      space  ".syllable_count.should == 2
    end
	end

  describe ".haiku?" do
    it "should know that 17 is the number" do
      "one two three".haiku?.should == false
    end

    it "should know if a string is a haiku" do
      "this is a haiku written in order to test that i know haiku".haiku?.should == true
    end

    it "should know that a string is not a haiku" do
      "i am not a haiku though i am made of seven teen syllables".haiku?.should == false
    end

  end


end