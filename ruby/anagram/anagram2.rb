class Anagram
  def initialize(word)
    @word = Word.new(word).downcase
  end

  def match(words)
    words.select { |w| @word.anagram_of?(w.downcase) }
  end
end

class Word < String
  def anagram_of?(word)
    (self != word) && (letters(self) == letters(word))
  end

  def letters(word)
    word.chars.sort
  end
end