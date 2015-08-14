require 'test_helper'

class EdgeDetectorTest < Minitest::Test


  def test_vertical_line
    input = File.expand_path('../../pictures/airplane.png', __FILE__)
    image = ChunkyPNG::Image.from_file(input)

    standard = EdgeDetector.new(image)
    sobel  = SobelEdgeDetector.new(image)

    output_standard = File.expand_path('../../output/airplane_standard.png', __FILE__)
    output_sobel = File.expand_path('../../output/airplane_sobel.png', __FILE__)

    standard.detect_edges.save(output_standard)
    sobel.detect_edges.save(output_sobel)
  end

  def test_horizontal_line
    input = File.expand_path('../../pictures/robot.png', __FILE__)
    image = ChunkyPNG::Image.from_file(input)

    standard = EdgeDetector.new(image)
    sobel  = SobelEdgeDetector.new(image)

    output_standard = File.expand_path('../../output/robot_standard.png', __FILE__)
    output_sobel = File.expand_path('../../output/robot_sobel.png', __FILE__)

    standard.detect_edges.save(output_standard)
    sobel.detect_edges.save(output_sobel)
  end



end