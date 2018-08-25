
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "predictor"
  spec.version       = "0.1.0"
  spec.authors       = ["Gilberto Villa"]
  spec.email         = ["ingilniero@gmail.com"]

  spec.summary       = "Predictor Core"

  spec.files         = Dir["{lib}/**/*", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'trueskill'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
