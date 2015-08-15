module EdgeDetect
  
  ## 
  # Abstract base class that provides the basis for both, 
  # the horizontal and vertical differ.
  #
  class Differ

    ## 
    # Initializes a new differ with a given image
    # 
    # @param image [ChunkyPNG::Image] the image that should be diffed
    #
    def initialize(image)
      @image = image
      @gray_scaler = GrayScaler.new(image)
    end

    ## 
    # Should return the diffed value of the given pixel.
    # If the pixel is out of bounds 0 should be returned.
    # 
    # @return [Integer] a value between 0 and 255 representing a grayscale value.
    #
    def [](x, y)
      raise NotImplementedError
    end

    ##
    # Returns the nearby diffs of the given coordinates (x, y) with respect to 
    # the given radius.
    #
    # @return [Array<Array<Integer>>] a two dimensional array with the diffs.
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
