require_relative 'string.rb'
require_relative 'syllable_dictionary.rb'
require_relative 'web_scraper.rb'

class String
  def haiku!
    words = self.split(" ")
    haiku = []
    count = 0
    until count == 5
      word = words.shift
      count += word.syllable_count
      haiku << word
    end
    haiku << "/"
    until count == 12
      word = words.shift
      count += word.syllable_count
      haiku << word
    end
    haiku << "/"
    haiku << words
    haiku.join(" ")
  end
end

#need to fix this so it saves value of latest pulled tweet (EOF trick?)
Twitter.home_timeline(count: 1).each do |tweet|
  MAX_ID = tweet.id
end

13.times do
  File.open("haiku_tweets.txt", "a") do |file|
    Twitter.home_timeline(count: 200, max_id: MAX_ID).each do |tweet|
      split_tweet = tweet.text.split(":")
      text = split_tweet[1]
      author = split_tweet[0].split("@")[1]
      file.puts text.haiku!
      file.puts "Written by @#{author}"
      file.puts
      MAX_ID = tweet.id
    end
  end
  sleep 5
end
