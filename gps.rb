# author: Thato Semoko
#

class GPS

  def initialize
    @orientations = %w[N E S W] # useful to list them clockwise direction
    @orientation_index = 0
  end

  def orientation
    @orientations[@orientation_index]
  end

  def turn(direction)
    # turning left means going clockwise on the compass
    # turning right means going anti-clockwise on the compass
    @orentation_index = direction == "L" ? @orientation_index+1 : @orientation_index-1

    # return orientation
    orientation
  end

  def move
  end
end
