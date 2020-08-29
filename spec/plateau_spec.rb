require_relative '../plateau'

describe Plateau do 

  before do
    @grid = Plateau.new(15,15)
  end

  context "Setup grid" do
    it "should setup a 15x15 grid" do
      expect(@grid.to_s).to eql '(15, 15)'
    end
  end
end
