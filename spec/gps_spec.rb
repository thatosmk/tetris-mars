require_relative '../gps'

describe GPS do 

  before do
    @gps = GPS.new("S")
  end

  context "GPS module test" do
    it "should initialise with south (S) orientation" do
      expect(@gps.orientation).to eql 'S'
    end

    it "should turn right to west (W) orientation" do
      expect(@gps.turn('R')).to eql 'W'
    end

    it "should turn L to east (E) orientation" do
      expect(@gps.turn('L')).to eql 'E'
    end
  end
end
