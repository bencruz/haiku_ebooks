class String
  BAD_WORDS = %w(a about all and are as at be because but can't do don't dont
    even feel feels for get getting goes going gonna has have he her his i i'll
    i'm if im in is it it's its just keep lets like looks make makes me my of
    on or really say see she should so some stay such take tell that that's
    thats the their then there theres there's to u up used want wants were what
    whats when where who will with won't wont would you)

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
    false_or_words = count_to(5, words)
    false_or_words = count_to(7, false_or_words) if false_or_words
    !!false_or_words
  end

  def count_to(num, words)
    count = 0
    until count == num
      last = words.shift
      count += last.syllable_count
      return false if count > num
    end
    return false if BAD_WORDS.include?(last.downcase)
    words
  end
end
