  # @current_search_word = file_name
  # 
# #searches a nokogiri document
# 	def find_tweet
# 		search_twitter.css('p.tweet-text').each do |tweet|
# 			next_word = select_tweet_data(tweet)
# 				next if next_word.nil?
# 				next if next_word[1].nil?
# 				next if count_syllables(next_word[1]).nil?
# 			if syllable_count + count_syllables(next_word[1]) <= @syllable_target
# 				return next_word[1]
# 			end
# 		end
# 	end

# #FINDS SEARCH WORD + ONE MORE WORD, SO RESULT[1] = new word
# 	def select_tweet_data(tweet)
# 	/#{@current_search_word}+\s([a-z]+)/.match(tweet.text)
# 	end

class WebScraper
  attr_reader :base_url
  attr_accessor :search_term

  def initialize
    @base_url = "https://twitter.com/search?q="
  end

  #Scrapes a Nokogiri doc
  def scrape
    Nokogiri::HTML(open(@base_url + @search_term))
  end

  #Extracts array of raw tweet strings from Noko
  def tweets
  	tweets = []
  	scrape.css('p.tweet-text').each do |tweet|
  		tweets << tweet.text
  	end
  	tweets
  end

  #filters tweets for potential stanzas/lines
  def possible_stanzas
  	tweets.map do |tweet|
  		x = /#{@search_term}+\s([a-z]+\s)+/.match(tweet)
  		x[0] unless x.nil?
  	end.compact
  end

end

