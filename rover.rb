# author: Thato Semoko
# Set up the rover mobile
require './gps'

class Rover
  attr_reader :x, :y, :orientation
  
  def initialize(x, y, d, grid)
    @x, @y, @orientation = x, y, d
    @steer = %w[L R]
    @gps = GPS.new(d)
    @grid = grid
  end

  # use GPS to turn otherwise continue forward
  def drive(cmd)
    if @steer.include?(cmd)
      @orientation = @gps.turn(cmd)
    else
      # move forward
      move
    end
  end

  def move
    case @orientation
    when "N"
      @y += 1
    when "S"
      @y -= 1
    when "E"
      @x += 1
    else
      @x -= 1
    end
  end

  def to_s
    "Rover is at #{x} #{y} #{orientation}"
  end
end
