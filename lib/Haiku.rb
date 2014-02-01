require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'
require_relative 'web_scraper.rb'
require_relative 'db_connection.rb'

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
    Twitter.retweet(tweet.id)
  end

  def self.save_tweet(tweet)
    split_tweet = tweet.text.split(":")
    text = split_tweet[1]
    author = split_tweet[0].split("@")[1]

    Haiku.create!(:tweet_id => tweet.id,
      :author => "@#{author}",
      :body => text.haikuify,
      :posted_at => tweet.created_at)
  end

  def process_tweet(tweet)
    HaikuFinder.post_tweet(tweet)
    HaikuFinder.save_tweet(tweet)
  end
end

loop do
  HaikuFinder.process_tweet(HaikuFinder.run_bot)
  sleep 1200
end
