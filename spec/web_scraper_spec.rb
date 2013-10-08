require 'spec_helper'

describe WebScraper do

	before(:all) { @scraper = WebScraper.new }
	before(:all) { @scraper.search_term = "testing"}

	it "should have Twitter as .base_url" do
		@scraper.base_url.should == "https://twitter.com/search?q="
	end

	it "should have a .current_search_term" do
		@scraper.search_term.should == "testing"
	end

	specify ".scrape should return a Nokogiri document for search query" do 
		VCR.use_cassette("nokogiri") do 
			x = @scraper.scrape
			x.should be_an_instance_of Nokogiri::HTML::Document 
			x.css('strong.search-query').text.should == "testing"
		end
	end

	specify ".tweets should return an array of tweets" do
    VCR.use_cassette("nokogiri") do 
      @scraper.tweets.should be_an_instance_of Array
    end
  end

  specify "#possible_stanzas returns array of filtered tweets" do
    VCR.use_cassette("nokogiri") do 
      @scraper.possible_stanzas[1].start_with?("testing").should == true
    end
  end
end