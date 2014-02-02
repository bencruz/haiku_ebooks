require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'
require_relative 'web_scraper.rb'
require_relative 'db_connect.rb'

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
    puts tweet.text
    Haiku.create!(:tweet_id => tweet.id,
      :author => "@#{tweet.user.screen_name}",
      :body => tweet.text.haikuify,
      :posted_at => tweet.created_at)
  end

  def self.process_tweet(tweet)
    puts "got one!"
    HaikuFinder.post_tweet(tweet)
    HaikuFinder.save_tweet(tweet)
  end
end

loop do
  puts "starting search"
  HaikuFinder.process_tweet(HaikuFinder.run_bot)
  sleep 1200
end
