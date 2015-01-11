# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dindi/version'

Gem::Specification.new do |s|
  s.name = "dindi"
  s.version = Dindi::VERSION
  s.authors = ["Samuel Chandra"]
  s.email = ["001@samuelc.com"]
  s.summary = "Dindi is a hit from Sinatra"
  s.description = "This gem will create a modular base for a new Sinatra app"
  s.homepage = "http://github.com/samchandra/dindi"
  s.license = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "bundler", "~> 1.7"
  s.add_runtime_dependency "colorize", "~> 0"
end

