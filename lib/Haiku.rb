require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'
require_relative 'web_scraper.rb'

begin
  last_tweet_time = Time.now - 120
  TweetStream::Client.new.sample(language: 'en') do |status|
    print "."
    if status.text.haiku?
      p "WE GOT ONE!"
      File.open("tweet_log.txt", "a") { |f| f.write("#{status.author}: #{status.text} #{status.id}") }
      tweet_time = Time.now
      if tweet_time - last_tweet_time > 120
        Twitter.retweet(status.id) 
        last_tweet_time = tweet_time
      end
    end
  end
rescue StandardError
  sleep 600
  retry
end



