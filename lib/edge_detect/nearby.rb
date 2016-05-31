module EdgeDetect
  ##
  # The nearby module provides a method that uses the [x, y] method
  # to query a two dimensional array.
  #
  module Nearby

    ##
    # Returns the nearby values of the given coordinates (x, y) with respect to
    # the given radius.
    #
    # @return [Array<Array<Value>>] a two dimensional array with the Values.
    #
    def nearby(x, y, radius)
      output = []
      ((x - radius)..(x + radius)).each do |i|
        row = []
        ((y - radius)..(y + radius)).each do |j|
          row << self[i, j]
        end
        output << row
      end
      output
    end
  end
end
