require 'matrix'

module EdgeDetect

  class EdgeDetector

    attr_reader :image

    def initialize(image)
      @image = image
    end

    def detect_edges
      h_differ = HorizontalDiffer.new(self.image)
      v_differ = VerticalDiffer.new(self.image)

      self.image.width.times do |i|
        self.image.height.times do |j|
          
        end
      end

    end

  end


end
