require_relative '../lib/string.rb'
require_relative '../lib/syllable_dictionary.rb'
require_relative '../lib/web_scraper.rb'

TweetStream::Client.new.sample(language: 'en') do |status|
	last_tweet_time = Time.now
	if status.text.haiku?
		tweet_time = Time.now
		if tweet_time - last_tweet_time > 120
			Twitter.retweet(status.id) 
			last_tweet_time = tweet_time
		end
		File.open("/tweet_log.txt", "a") do |f|
			f.puts status.text
			f.puts status
		end
	end
end




