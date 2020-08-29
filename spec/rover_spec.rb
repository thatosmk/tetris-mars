require_relative '../rover'

describe Rover do 

  context "Rover module test" do
    it "shold begin at position 3,4 E" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(3, 4, 'E', grid)
      expect(rover.orientation).to eql "E"
    end

    it "should move forward 1 step" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(3, 4, 'E', grid)
      rover.drive('M')
      expect(rover.x).to eql 4
      expect(rover.y).to eql 4
      expect(rover.orientation).to eql 'E'
    end

    it "should move to position 5, 5 facing N" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(3, 4, 'E', grid)
      rover.drive('M')
      rover.drive('M')
      rover.drive('L')
      rover.drive('M')
      expect(rover.x).to eql 5
      expect(rover.y).to eql 5
      expect(rover.orientation).to eql 'N'
    end
  end
end
