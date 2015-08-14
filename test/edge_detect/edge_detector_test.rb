require 'test_helper'

class EdgeDetectorTest < Minitest::Test

  def setup
    @vertical_line = create_vertical_line
    @horizontal_line = create_horizontal_line
  end

  def test_a
    edge = EdgeDetector.new(@vertical_line)
    edge.detect_edges
  end

  private 
  def create_horizontal_line
    image = ChunkyPNG::Image.new(7, 3, ChunkyPNG::Color::TRANSPARENT)
    (1..5).each do |i|
      image[i, 1] = ChunkyPNG::Color('black')
    end
    image
  end

  def create_vertical_line
    image = ChunkyPNG::Image.new(3, 7, ChunkyPNG::Color::TRANSPARENT)
    (1..5).each do |i|
      image[1, i] = ChunkyPNG::Color('black')
    end
    image
  end

end