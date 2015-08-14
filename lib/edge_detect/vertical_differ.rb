module EdgeDetect
  
  # Simple Datastructure to hold horizontal and vertical diffs as one object
  class VerticalDiffer < Differ

    def [](x, y)
      begin
        @gray_scaler[x, y] - @gray_scaler[x - 1, y]
      rescue ChunkyPNG::OutOfBounds => e
        0
      end
    end

  end
end