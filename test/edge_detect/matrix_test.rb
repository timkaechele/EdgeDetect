require 'test_helper'

class MatrixTest < Minitest::Test

  def test_sum
    m = Matrix[ [2, 1], [1, 2] ]

    assert_equal(6, m.sum)
  end


  def test_sum_with_negative_and_positive_integers
    m = Matrix[ [-1, 5], [3, -5] ]

    assert_equal(2, m.sum)
  end


end