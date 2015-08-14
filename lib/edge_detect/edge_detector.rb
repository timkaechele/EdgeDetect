require 'matrix'

module EdgeDetect

  class EdgeDetector

    attr_reader :image

    def initialize(image)
      @image = image
    end

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
