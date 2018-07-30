
class Dominoes
    def self.chain(dominoes_input)
      Chain.new(dominoes_input).sort
    end
end

class Chain
  def initialize(dominoes_input)
    @dominoes = dominoes_input;
    @dominoes_size = dominoes_input.size
  end

  def sort
    return @dominoes if @dominoes.empty?

    @dominoes.permutation(@dominoes_size).each do |dominoes|
      @chain = []
      dominoes.each do |domino|
        add(domino)
      end
      return @chain if (first_half == last_half) && (@dominoes_size == @chain.size)
    end
    return nil
  end

  def add(domino)
    return @chain << domino if @chain.empty? || domino[0] == last_half
    return @chain.unshift domino if domino[1] == first_half
    return @chain.unshift domino.reverse if domino[0] == first_half
    return @chain << domino.reverse if domino[1] == last_half
  end

  def first_half
    return @chain.first[0]
  end

  def last_half
    return @chain.last[1]
  end
end

module BookKeeping
  VERSION = 1
end
