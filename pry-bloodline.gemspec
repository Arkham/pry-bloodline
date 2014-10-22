# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pry-bloodline/version'

Gem::Specification.new do |spec|
  spec.name          = "pry-bloodline"
  spec.version       = PryBloodline::VERSION
  spec.authors       = ["Ju Liu"]
  spec.email         = ["ju.liu@welaika.com"]
  spec.summary       = %q{A glorious descendant of a noble lineage of status lines, to be used with Pry.}
  spec.description   = %q{A Pry plugin which enables a nice looking prompt, with many customizable components.}
  spec.homepage      = "https://github.com/Arkham/pry-bloodline"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.0.0'
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.start_with? "images" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "pry", "~> 0.10"
  spec.add_runtime_dependency "colorize", "~> 0.7"
end
