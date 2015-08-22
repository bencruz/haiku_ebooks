require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'

require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

streamy = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

class HaikuFinder
  def self.run_bot
    begin
      streamy.sample(language: 'en') do |tweet|
        return tweet if tweet.text.haiku?
      end
    rescue
      sleep 300
      retry
    end
  end

  def self.post_tweet(tweet)
    puts "got one!"
    client.retweet(tweet.id)
  end
end

puts "starting search"
HaikuFinder.post_tweet(HaikuFinder.run_bot)

