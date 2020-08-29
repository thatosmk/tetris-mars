require "./plateau"
require "./rover"


# enter filename
file_data = File.open(ARGV[0])

input_data = file_data.readlines.map(&:chomp)

if file_data
  # use first line to setup grid
  xy = input_data[0].split(" ")
  grid = Plateau.new(xy[0].to_i,xy[1].to_i)

  # no of rovers
  no_rovers = input_data[1..input_data.length].length
  i = 1

  # FIXME
  while (i < no_rovers)
    # use second line to setup rover initial position
    position = input_data[i].split(" ")
    rover = Rover.new(position[0].to_i,position[1].to_i, position[2], grid)

    # setup exploration instructions
    explore_instructions = input_data[i+1].chomp.split('')

    # start to move the first rover
    for instruction in explore_instructions do
      rover.drive(instruction)
    end

    # final position
    puts rover.to_s
    i+=1
  end

  file_data.close
else
  puts "unable to open file"
end
