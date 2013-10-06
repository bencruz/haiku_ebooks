#monkey patching strings to know their syllable count
class String

	def syllable_count
		self.split(" ").inject(0) { |sum, word|	sum + SYLLABLE_DICTIONARY[word.upcase] }
	end

end

