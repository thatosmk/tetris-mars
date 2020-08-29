# author: Thato Semoko
# setup the plateau

class Plateau

  def initialize(x,y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def y
    @y
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end
