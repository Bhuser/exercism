class Scrabble

  # MAPPING = {
  #     'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1,
  #     'l' => 1, 'n' => 1, 'r' => 1, 's' => 1, 't' => 1,
  #     'd' => 2, 'g' => 2,
  #     'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3,
  #     'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
  #     'k' => 5,
  #     'j' => 8, 'x' => 8,
  #     'q' => 10,'z' => 10
  # }

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
    @word.chars.map{ |char| letter_values[char.downcase] }.sum
  end

  def letter_values
    Hash[*LETTER_VALUES.map do |letters, value|
      letters.map { |letter| [letter, value] }
    end.flatten]
  end

end