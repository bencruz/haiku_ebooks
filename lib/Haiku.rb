require_relative '../lib/string.rb'
require_relative '../lib/syllable_dictionary.rb'
require_relative '../lib/web_scraper.rb'

TweetStream::Client.new.sample do |status|
	if status.text.haiku?
		Twitter.retweet(status.id) 
		puts status.text
	end
	print "."
end