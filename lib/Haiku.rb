require_relative '../lib/string.rb'
require_relative '../lib/syllable_dictionary.rb'
require_relative '../lib/web_scraper.rb'

class HaikuFinder
  def self.run_bot
    begin
      TweetStream::Client.new.sample(language: 'en') do |status|
        return status if status.text.haiku?
      end
    rescue
      sleep 300
      retry
    end
  end

  def self.post_tweet(status)
    Twitter.retweet(status.id)
  end

end

loop do
  HaikuFinder.post_tweet(HaikuFinder.run_bot)
  sleep 900
end
