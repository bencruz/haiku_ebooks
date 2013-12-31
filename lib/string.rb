class String
  BAD_WORDS = %w(a about all and be because but can't don't feel feels for
    getting goes has have he her his i i i'll if in is it it's its just keep
    lets looks my of on or really see she should stay such take tell that the
    their then to up want were what when where with won't you)

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
    return false if BAD_WORDS.include?(last.downcase)
    until count == 12
      last = words.shift
      count += last.syllable_count
      return false if count > 12
    end
    return false if BAD_WORDS.include?(last.downcase)
    true
  end
end
