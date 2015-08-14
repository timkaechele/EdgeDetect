# Edgedetect

EdgeDetect is a pure ruby implementation of an edge detect algorithm. It is by 
no means fast enough to be considered useful in a real world application, it 
is just a proof of concept. It is build around the ChunkyPNG gem and therefore 
can only work with PNG files. 

**Warning:** Because I find it hard to test a purely subjective experience of 
a good edge detection, I didn't write tests in the normal way. If you run the 
tests some basic math stuff will be tested, but the final edge detection is 
not tested, instead you can view the results in the `test/output` folder.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edgedetect', github: "timkaechele/edgedetect"
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ git clone git@github.com:timkaechele/edgedetect.git
$ cd edgedetect
$ rake install
```

## Usage

There are two basic EdgeDetect implementations, one that naively builds the 
difference between the gray value of each individual pixel and one more 
advanced but also slower one, that uses the sobel operation to detect
the edges. Both can be used in the same way.

```ruby
image = ChunkyPNG::Image.from_file("myfile.png")

naive = EdgeDetect::EdgeDetector.new(image)
sobel = EdgeDetect::SobelEdgeDetector.new(image)

naive.detect_edges # => ChunkyPNG::Image
sobel.detect_edges # => ChunkyPNG::Image
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/edgedetect. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

