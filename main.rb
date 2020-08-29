#!/usr/bin/env ruby
require "./plateau"


# read a file of input
filename = "./data/data0.txt"
input_data = IO.readlines(filename)
if input_data
  # use first line to setup grid
  xy = input_data[0].split(" ")
  grid = Plateau.new(xy[0],xy[1])
  puts grid.to_s
else
  puts "unable to open file"
end

