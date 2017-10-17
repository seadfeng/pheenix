# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pheenix/version"

Gem::Specification.new do |spec|
  spec.name          = "pheenix"
  spec.version       = Pheenix::VERSION
  spec.authors       = ["Sead Feng"]
  spec.email         = ["seadfeng@gmail.com"]

  spec.summary       = "Pheenix APi"
  spec.description   = "pheenix Api gem"
  spec.homepage      = "https://github.com/seadfeng/pheenix"
  spec.license       = "MIT" 

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "curb"

end
