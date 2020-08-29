# author: Thato Semoko
# GPS module of the Tetris Mars Rover

class GPS

  def initialize(d)
    @orientations = %w[N E S W] # useful to list them clockwise direction
    @orientation_index = @orientations.index(d)
  end


  def turn(direction)
    # turning left means going clockwise on the compass
    #   turning right means going anti-clockwise on the compass
    @orientation_index = direction == "R" ? @orientation_index+1 : @orientation_index-1

    # return orientation
    orientation
  end

  def orientation
    @orientations[@orientation_index % @orientations.length]
  end
end
