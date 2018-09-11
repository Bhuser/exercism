class KarateChop
  def self.chop(num, array)
    Karate.new(num, array).chop
  end
end

class Karate
  attr_reader :sorted_array

  def initialize(num, array)
    @sorted_array = array
    @num = num
  end

  def chop
    return -1 if @sorted_array.empty?
    # puts "running binary 1"
    # binary_one

    # puts "running binary 2"
    binary_two(@num, @sorted_array)
  end

  def binary_two (num, array)
    middle_index = array.size/2
    return ((num == array[middle_index]) ? middle_index : -1) if array.size == 1

    pos = binary_two(num, array[0...middle_index])
    return pos if pos != -1

    pos = binary_two(num, array[middle_index..-1])
    return pos + middle_index if pos != -1

    return -1
  end

  def binary_one
    middle_index = find_middle(@sorted_array)

    if !@sorted_array.include?(@num)
      -1
    elsif @sorted_array[middle_index] == @num
      return middle_index
    elsif @num > @sorted_array[middle_index]
      find_index
    elsif @num < @sorted_array[middle_index]
      find_index
    end
  end

  def find_index
    @sorted_array.each_with_index do |number, index|
      if number == @num
        return index
      end
    end
  end

  def find_middle(array)
    (array.length - 1)/2
  end
end