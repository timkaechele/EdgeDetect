module EdgeDetect
  ##
  # Grayscales a given image
  # 
  class GrayScaler

    ## 
    # Initializes a new GrayScaler with the given image
    #
    # @param image [ChunkyPNG::Image] the image that should be grayscaled.
    #
    def initialize(image)
      @image = image
    end

    ## 
    # Returns the grayscale value of the given coordinate. 
    # If the coordinate is out of bounds 0 will be returned.
    #
    # @return [Integer] a value between 0 and 255.
    #
    def [](x, y)
      begin
        (ChunkyPNG::Color.to_grayscale(@image[x, y]) & 0x0000ff00) >> 8
      rescue ChunkyPNG::OutOfBounds => e
        0
      end
    end

    ##
    # Returns the nearby grayscale values of the given coordinates (x, y) with 
    # respect to the given radius.
    #
    # @return [Array<Array<Integer>>] a two dimensional array with the grayscale values.
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
