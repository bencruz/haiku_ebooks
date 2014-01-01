dict_path = File.expand_path("../syllable_dictionary.txt", __FILE__)
dict = File.readlines(dict_path, "r").join.split("\n")

SYLLABLE_DICTIONARY = Hash.new
dict.each do |entry|
  word, syllables = entry.strip.split(",")
  SYLLABLE_DICTIONARY[word] = syllables.to_i
end
