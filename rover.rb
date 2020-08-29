# author: Thato Semoko
require './gps'

class Rover
  attr_reader :x, :y, :d
  
  def initialize(x,y, grid)
    @x, @y = x, y # default positions
    @d = "N"
    @steer = %w[L R]
    @gps = GPS.new
    @grid = grid
  end

  def drive(cmd)
    if @steer.include?(cmd) # turn left or right
      @d = @gps.turn(cmd)
    else
      # move forward
      move
    end
  end

  def move
    case @d
    when "N"
      @y = @y < @grid.y ? @y+1 : @y
    when "S"
      @y -= 1
    when "E"
      @x += 1
    else
      @x -= 1
    end
  end

  def to_s
    "Rover at (#{@x}, #{@y}, #{@d})"
  end
end
