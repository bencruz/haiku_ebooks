#monkey patching strings to know their syllable count/haiku-ness
class String

	def syllable_count
		self.split(" ").inject(0) { |sum, word|	sum + SYLLABLE_DICTIONARY[word.upcase] }
	end

	def haiku?
		return false if self.syllable_count != 17
		words = self.split(" ")
		count = 0
		until count == 5
			count += words.shift.syllable_count
			return false if count > 5 
		end
		until count == 12
			count += words.shift.syllable_count
			return false if count > 12 
		end
		true
	end

end

