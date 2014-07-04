# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dindi"
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Samuel Chandra"]
  s.date = "2014-07-03"
  s.description = "This gem will create a modular base for a new Sinatra app"
  s.email = "samuelchandra@yahoo.com"
  s.executables = ["dindi"]
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["bin/dindi", "LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/samchandra/dindi"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Dindi is a hit from Sinatra"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colorize>, [">= 0"])
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<colorize>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<colorize>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
