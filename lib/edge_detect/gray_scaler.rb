module EdgeDetect
  class GrayScaler

    def initialize(image)
      @image = image
    end

    def [](x, y)
      ChunkyPNG::Color.to_grayscale(@image[x, y])
    end

  end
end