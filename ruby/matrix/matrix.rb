class Matrix
  def initialize (input)
    @input  = input
  end

  def rows
    findArray()
  end

  def columns
    findArray().transpose
  end

  def findArray
    @input.split("\n").map { |i| i.split(" ").map { |n| n.to_i} }
  end
end