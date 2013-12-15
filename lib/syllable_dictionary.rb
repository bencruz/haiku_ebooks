dict = File.readlines("../lib/syllable_dictionary.txt", "r").join.split("\n")
SYLLABLE_DICTIONARY = Hash.new
dict.each do |entry|
  k, v = entry.strip.split(",")
  SYLLABLE_DICTIONARY[k] = v.to_i
end
