module EdgeDetect
  
  # Simple Datastructure to hold horizontal and vertical diffs as one object
  class HorizontalDiffer < Differ

    def [](x, y)
      begin
        @gray_scaler[x, y] - @gray_scaler[x, y - 1]
      rescue ChunkyPNG::OutOfBounds => e
        0
      end
    end

  end
end