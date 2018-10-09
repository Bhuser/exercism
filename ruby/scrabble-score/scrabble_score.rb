class Scrabble

  LETTER_VALUES = {
      %w(a e i o u l n r s t) => 1,
      %w(d g) => 2,
      %w(b c m p) => 3,
      %w(f h v w y) => 4,
      %w(k) => 5,
      %w(j x) => 8,
      %w(q z) => 10
  }

  def initialize(word)
    @word = word || ""
  end

  def self.score(word)
    new(word).score
  end

  def score
    return 0 if @word =~ /\A\s*\Z/
    @word.chars.sum{ |char| letter_values[char.downcase] }
  end

  def letter_values
    @letter_values ||= Hash[*LETTER_VALUES.map do |letters, value|
      letters.map { |letter| [letter, value] }
    end.flatten]
  end

end