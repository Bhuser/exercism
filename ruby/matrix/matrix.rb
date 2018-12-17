class Matrix

  attr_reader :rows

  def initialize (input)
    @rows  = input.each_line.map { |i| i.chomp.split.map(&:to_i) }
  end

  def columns
    @rows.transpose
  end
end