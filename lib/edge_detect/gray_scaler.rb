module EdgeDetect
  class GrayScaler

    def initialize(image)
      @image = image
    end

    def [](x, y)
      begin
        (ChunkyPNG::Color.to_grayscale(@image[x, y]) & 0x0000ff00) >> 8
      rescue ChunkyPNG::OutOfBounds => e
        0
      end
    end

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