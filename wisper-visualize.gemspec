# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wisper/visualize/version'

Gem::Specification.new do |spec|
  spec.name          = "wisper-visualize"
  spec.version       = Wisper::Visualize::VERSION
  spec.authors       = ["Kris Leech"]
  spec.email         = ["kris.leech@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'wisper'
  spec.add_dependency 'ruby-graphviz'
end
