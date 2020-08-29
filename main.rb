#!/usr/bin/env ruby
require "./plateau"
require "./rover"


# enter filename
dir = "./data/"
print "Enter filename: "
filename = gets
input_data = IO.readlines(dir+filename)
if input_data
  # use first line to setup grid
  xy = input_data[0].chomp.split(" ")
  grid = Plateau.new(xy[0].to_i,xy[1].to_i)

  # setup the rover mobile
  # use second line to setup rover initial position
  position = input_data[1].chomp.split(" ")
  rover = Rover.new(position[0].to_i,position[1].to_i, position[2], grid)

  # setup exploration instructions
  explore_instructions = input_data[2].chomp.split('')

  # start to move the first rover
  for instruction in explore_instructions do
    rover.drive(instruction)
    puts rover.to_s
  end
else
  puts "unable to open file"
end

