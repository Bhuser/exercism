class Complement

  DNA_TO_RNA = {
      "C" => "G",
      "G" => "C",
      "T" => "A",
      "A" => "U",
  }

  def self.of_dna (strand)
    return '' unless strand.chars.all? { |value| DNA_TO_RNA.keys.include? value }
    strand.chars.map { |value| DNA_TO_RNA[value] }.join
  end
end

module BookKeeping
  VERSION = 4
end