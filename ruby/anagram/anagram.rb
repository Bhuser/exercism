#!/usr/bin/env ruby

  hash = Hash.new { |hash, key| hash[key] = [] }

  File.open("wordlist.txt", "r") do |f|
    f.each_line do |line|
      hash[line.strip.downcase.chars.sort.join] << line.strip
    end
  end

  hash.values.reject{|a| a.length == 1}.each{|i| puts i.join(' ')}

