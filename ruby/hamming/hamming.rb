class Hamming
  def self.compute(string_a, string_b)
    if string_a.length != string_b.length
      raise ArgumentError, 'Strings must be same length'
    end
    combined = string_a.chars.zip(string_b.chars)
    combined.count { |first, last| first != last }
  end
end

module BookKeeping
  VERSION = 3
end
