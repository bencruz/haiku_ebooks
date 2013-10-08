#Creates global hash dictionary 
dict = File.readlines("./lib/syllable_dictionary.txt", "r").join.split("\n")
SYLLABLE_DICTIONARY = Hash.new
dict.each do |entry|
	entry = entry.strip.split(",")
	SYLLABLE_DICTIONARY[entry[0]] = entry[1].to_i
end
