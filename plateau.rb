# author: Thato Semoko
# setup the plateau

class Plateau
  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end

  def to_s
    "(#{x}, #{y})"
  end
end
