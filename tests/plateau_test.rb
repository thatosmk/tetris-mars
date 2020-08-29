require './plateau'
require 'minitest/autorun'

class PlateauTest < MiniTest::Test
  def test_normal
    grid = Plateau.new(9,9)
    assert_equal "(9, 9)", grid.to_s,"it should be setup correct 9x9 grid"
  end
end
