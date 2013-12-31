dict = File.readlines("../lib/syllable_dictionary.txt", "r").join.split("\n")
SYLLABLE_DICTIONARY = Hash.new
dict.each do |entry|
  word, syllables = entry.strip.split(",")
  SYLLABLE_DICTIONARY[word] = syllables.to_i
end
