# author: Thato Semoko
# setup the plateau

class Plateau
  attr_reader :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end

  def visualise(r_x, r_y)
    for i in (@x).downto(0) 
      for j in (@y).downto(0)
        if (r_x)==i && (@y-r_y)==j
          print "+"
        else
          print "-"
        end
      end
      print "\n"
    end
  end

  def to_s
    "(#{x}, #{y})"
  end
end
