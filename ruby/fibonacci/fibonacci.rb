#!/usr/bin/env ruby

class Fibonacci

  def sum(limit, sum_type)
    fib = [1,1]

    until fib.last > limit
      fib << fib.last(2).sum
    end
    return_sum(fib, sum_type)
  end

  def return_sum (numbers, sum_type)
    case sum_type
    when 'even'
      puts numbers.select { |n| n.even? }.sum
    when 'odd'
      puts numbers.select { |n| n.odd? }.sum
    else
      puts numbers.sum
    end
  end

end

f = Fibonacci.new
f.sum(4_000_000, 'even')