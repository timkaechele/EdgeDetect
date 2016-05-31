module EdgeDetect
  ##
  # Grayscales a given image
  #
  class GrayScaler
    include Nearby
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
  end
end
