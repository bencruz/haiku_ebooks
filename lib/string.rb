class String
  BAD_WORDS = %w(the on or because for with just feel to of getting don't can't
    won't want feels a with in is lets and it have about what such really i be
    but stay keep see looks their has take goes all should when it's its then
    if a he his she her where that were I I'll i'll you up)

  def syllable_count
    self.split(" ").inject(0) do |sum, word|
      sum + SYLLABLE_DICTIONARY[word.upcase]
    end
    rescue TypeError
      return nil
  end

  def haiku?
    return false if self.syllable_count != 17
    words = self.split(" ")
    count = 0
    until count == 5
      last = words.shift
      count += last.syllable_count
      return false if count > 5
    end
    return false if BAD_WORDS.include?(last)
    until count == 12
      last = words.shift
      count += last.syllable_count
      return false if count > 12
    end
    return false if BAD_WORDS.include?(last)
    true
  end
end
