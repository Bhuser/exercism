require 'colorize'
# irb -r ./diversion.rb
# Notes to start: c = Diversion::Collection.new(3)

module Diversion
  class Atom
    attr_reader :string

    def initialize(s)
      @string = s
    end

    def adjacent_ones?
      [*0..@string.length-2].each do |pos|
        return true if @string.byteslice(pos,2).eql? '11'
      end
      false
    end

    def value
      @string
    end
  end

  class Collection
    attr_reader :atoms, :list, :results

    def initialize(digits)
      @list = [*0..(2**digits - 1)].map{ |d| d.to_s(2).rjust(digits,'0') }
      @atoms = []
      @list.each do |atom|
        @atoms << Diversion::Atom.new(atom)
      end
    end

    def show_adjacent_ones
      @atoms.each do |atom|
        if atom.adjacent_ones?
          puts atom.value.light_blue
        else
          puts (atom.value + " <-").light_yellow
        end
      end
    end

    def count_adjacent_ones
      count = 0
      @atoms.each do |atom|
        count = count + 1 unless atom.adjacent_ones?
      end
      count
    end
  end
end
