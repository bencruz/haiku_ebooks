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

# 	#searches twitter and returns a nokogiri document
# 	def search_twitter
# 		full_url = @base_url + @current_search_word
# 		Nokogiri::HTML(open(full_url))
# 	end

# #FINDS SEARCH WORD + ONE MORE WORD, SO RESULT[1] = new word
# 	def select_tweet_data(tweet)
# 	/#{@current_search_word}+\s([a-z]+)/.match(tweet.text)
# 	end

class WebScraper
  attr_reader :base_url

  def initialize
    @base_url = "https://twitter.com/search?q="
  end

  def scrape
    Nokogiri::HTML(open(@base_url))
  end

end
