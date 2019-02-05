#!/usr/bin/env ruby

require 'date'
require 'colorize'

start = Date.new 1901, 1, 1
total = 0

(100 * 12).times do |i|
  total += 1 if (start >> i).wday == 0
end

puts "  Total Sundays: #{total}  ".colorize(:color => :cyan, :background => :black)
