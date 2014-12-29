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
  # if rand < 0.75
    puts "starting search"
    HaikuFinder.post_tweet(HaikuFinder.run_bot)
  # else
  #   haikus = Twitter.retweeted_by_me(count: 100).map do |t|
  #     begin
  #       t.text.split(":")[1].haikuify.split("/")
  #     rescue
  #       nil
  #     end
  #   end.compact
  #   Twitter.update "#{haikus.sample[0].capitalize}\n#{haikus.sample[1].capitalize}\n#{haikus.sample[2].capitalize}"
  # end
  sleep 1200
end
