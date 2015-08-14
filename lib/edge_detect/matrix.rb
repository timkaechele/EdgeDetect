##
# Reopening of the Matrix class 
#
class Matrix

  ##
  # Returns the sum of all values of the matrix.
  #
  # @return [Number] the sum of all values of the matrix
  def sum
    self.inject(:+)
  end

end

