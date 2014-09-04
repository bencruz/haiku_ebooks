require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'
require_relative 'web_scraper.rb'

class HaikuFinder
  def self.run_bot
    begin
      TweetStream::Client.new.sample(language: 'en') do |tweet|
        return tweet if tweet.text.haiku?
      end
    rescue
      sleep 300
      retry
    end
  end

  def self.post_tweet(tweet)
    puts "got one!"
    Twitter.retweet(tweet.id)
  end
end

loop do
  puts "starting search"
  HaikuFinder.post_tweet(HaikuFinder.run_bot)
  sleep 1200
end
