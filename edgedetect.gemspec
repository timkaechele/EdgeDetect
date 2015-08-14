# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'edge_detect/version'

Gem::Specification.new do |spec|
  spec.name          = "EdgeDetect"
  spec.version       = EdgeDetect::VERSION
  spec.authors       = ["Tim Kächele"]
  spec.email         = ["mail@timkaechele.me"]

  spec.summary       = "Edge Detection written in Ruby"
  spec.description   = "A pure ruby implementation of an naive edge detection algorithm, as well as the sobel algorithm."
  spec.homepage      = "https://github.com/timkaechele/edgedetect"
  spec.license       = "GNU GPL v2"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"

  spec.add_dependency "chunky_png", "~> 1.3.4"

end
