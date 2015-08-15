module EdgeDetect
  
  ## 
  # Diffs the image horizontal.
  #
  class HorizontalDiffer < Differ

    ##
    # Calculates the diff of the the given coordinate relative to the
    # above pixel in the same column. 
    # 
    # The calculation is operated on the gray scale value of pixel 
    # If the given coordinate is out of bounds 0 (black) will be returned.
    #
    # @return [Integer] a value between 0 and 255
    #
    def [](x, y)
      begin
        @gray_scaler[x, y] - @gray_scaler[x, y - 1]
      rescue ChunkyPNG::OutOfBounds => e
        0
      end
    end

  end
end
