require 'spec_helper'

describe "SYLLABLE_DICTIONARY" do

  it "should load auto-magically" do
    SYLLABLE_DICTIONARY.count.should > 1
  end

  it "should return syllable counts" do
  	SYLLABLE_DICTIONARY["TESTING"].should == 2
  end

end