require 'spec_helper'

describe WebScraper do

	before(:all) { @scraper = WebScraper.new }

	it "should have Twitter as default url" do
		@scraper.base_url.should == "https://twitter.com/search?q="
	end

	it "#scrape should return a Nokogiri" do
		@scraper.scrape.should be_an_instance_of Nokogiri::HTML
	end

	# it "#find_text should return text" do

	# end

	it "should return potential haiku lines" do

	end

	




end