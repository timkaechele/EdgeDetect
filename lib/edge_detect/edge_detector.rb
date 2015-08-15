require 'matrix'

module EdgeDetect

  ##
  # Naive EdgeDetect Implementation
  #
  class EdgeDetector

    ##
    # The original image
    #
    attr_reader :image

    ## 
    # Initializes a new EdgeDetector with the given image.
    # 
    # @param image [ChunkyPNG::Image] the image that should be edge detected.
    #
    def initialize(image)
      @image = image
    end

    ##
    # Edge detects the image by building the horizontal and vertical diffs. 
    # (naive approach)
    # 
    # The original image will not be changed by this operation.
    # 
    # @return [ChunkyPNG::Image] the edge detected image.
    #
    def detect_edges
      image = ChunkyPNG::Image.new(@image.width, @image.height, ChunkyPNG::Color::TRANSPARENT)
      h_diff = HorizontalDiffer.new(self.image)
      v_diff = VerticalDiffer.new(self.image)

      self.image.width.times do |i|
        self.image.height.times do |j|
          
          value = (h_diff[i, j] + v_diff[i, j]).abs
          image[i, j] = ChunkyPNG::Color.rgb(value, value, value)
        end
      end
      image
    end   

  end


end
