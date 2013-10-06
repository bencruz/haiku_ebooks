require 'spec_helper'

describe String do
	it "should know it's #syllable_count" do
		"alpha".syllable_count.should == 2
	end

	it "should handle multi-word strings" do
		"alpha tango bravo nine".syllable_count.should == 7
	end

	it "should load SYLLABLE_DICTIONARY" do
		SYLLABLE_DICTIONARY.count.should > 1
	end
end