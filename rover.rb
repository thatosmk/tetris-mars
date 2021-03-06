# author: Thato Semoko
# Mars Rover class
require_relative './gps'

class Rover
  attr_reader :id, :x, :y, :orientation
  
  def initialize(i,x, y, d, grid)
    @id = i
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
      move
    end
  end

  def move
    case @orientation
    when "N"
      @y += 1 unless @y == @grid.y
    when "S"
      @y -= 1 unless @y == 0
    when "E"
      @x += 1 unless @x == @grid.x
    else
      @x -= 1 unless @x == 0
    end
  end

  def to_s
    "#{x} #{y} #{orientation}"
  end
end
