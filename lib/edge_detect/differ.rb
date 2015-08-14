module EdgeDetect
  
  class Differ

    def initialize(image)
      @image = image
      @gray_scaler = GrayScaler.new(image)
    end

    def [](x, y)
      raise NotImplementedError
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