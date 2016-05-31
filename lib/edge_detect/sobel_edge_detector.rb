module EdgeDetect

  ##
  # Sobel EdgeDetect Implementation
  #
  class SobelEdgeDetector < EdgeDetector

    ##
    # Edge detects the image by applying the sobel operations.
    #
    # The original image will not be changed by this operation.
    #
    # @return [ChunkyPNG::Image] the edge detected image.
    #
    def detect_edges
      image = ChunkyPNG::Image.new(@image.width, @image.height, ChunkyPNG::Color::TRANSPARENT)
      gray = GrayScaler.new(self.image)

      self.image.width.times do |i|
        self.image.height.times do |j|
          v_x = (sobel_x * Matrix.columns(gray.nearby(i, j, 1))).sum
          v_y = (sobel_y * Matrix.columns(gray.nearby(i, j, 1))).sum

          # / 10 because otherwise it's too much noise
          value = Math.sqrt(v_x ** 2 + v_y ** 2).to_i / 10
          image[i, j] = ChunkyPNG::Color.rgb(value, value, value)
        end
      end
      image
    end

    private

      ##
      # The sobel matrix to transform horizontal pixels
      #
      # @return [Matrix] the sobel matrix
      #
      def sobel_x
        @sobel_x ||= Matrix[
          [1, 0, -1],
          [2, 0, -2],
          [1, 0, -1]
        ]
      end

      ##
      # The sobel matrix to transform vertical pixels
      #
      # @return [Matrix] the sobel matrix
      #
      def sobel_y
        @sobel_y ||= Matrix[
          [1,   2,  1],
          [0,   0,  0],
          [-1, -2, -1]
        ]
      end

  end
end
