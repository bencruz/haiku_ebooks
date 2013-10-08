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
  		x = /#{@search_term}(\s([a-z]+\s)+)/.match(tweet)
  		x[0] unless x.nil?
  	end.compact
  end
end