require_relative '../rover'

describe Rover do 

  context "Moving within bounds of Plateau" do
    it "should begin at position 3,4 E" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(0, 3, 4, 'E', grid)
      expect(rover.orientation).to eql "E"
    end

    it "should move forward 1 step" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(0, 3, 4, 'E', grid)
      rover.drive('M')
      expect(rover.x).to eql 4
      expect(rover.y).to eql 4
      expect(rover.orientation).to eql 'E'
    end

    it "should move to position 5, 5 facing N" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(0, 3, 4, 'E', grid)
      rover.drive('M')
      rover.drive('M')
      rover.drive('L')
      rover.drive('M')
      expect(rover.x).to eql 5
      expect(rover.y).to eql 5
      expect(rover.orientation).to eql 'N'
    end
  end

  context "Attempt motion outside bounds of Plateau" do
    it "should not exceed upper plateau boundaries" do
      grid = Plateau.new(15, 15)
      rover = Rover.new(0, 14, 14, 'W', grid)
      rover.drive('R')
      rover.drive('M')
      rover.drive('R')
      rover.drive('M')
      rover.drive('M')
      rover.drive('L')
      rover.drive('M')
      expect(rover.x).to eql 15
      expect(rover.y).to eql 15
      expect(rover.orientation).to eql "N"
    end

    it "should not go beyong lower plateau boundaries" do
      grid = Plateau.new(5, 5)
      rover = Rover.new(0, 2, 2, 'E', grid)
      rover.drive('R')
      rover.drive('M')
      rover.drive('M')
      rover.drive('M')
      rover.drive('R')
      rover.drive('M')
      rover.drive('M')
      rover.drive('M')
      rover.drive('M')
      expect(rover.x).to eql 0
      expect(rover.y).to eql 0
      expect(rover.orientation).to eql 'W'
    end
  end
end
