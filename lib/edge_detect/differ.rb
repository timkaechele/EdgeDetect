module EdgeDetect

  ##
  # Abstract base class that provides the basis for both,
  # the horizontal and vertical differ.
  #
  class Differ
    include Nearby

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
  end
end
