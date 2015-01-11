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

  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "bin/dindi",
    "lib/version.rb",
    "lib/dindi.rb",
    "lib/dindi/command_parser.rb",
    "lib/dindi/file_helper.rb",
    "lib/dindi/file_templates/latest/Gemfile.erb",
    "lib/dindi/file_templates/latest/config.ru.erb",
    "lib/dindi/file_templates/latest/database.yml.erb",
    "lib/dindi/file_templates/latest/models.rb.erb",
    "lib/dindi/file_templates/shared/debug_on.rb.erb",
    "lib/dindi/file_templates/shared/deploy_setting.rb.erb",
    "lib/dindi/file_templates/shared/docs.haml.erb",
    "lib/dindi/file_templates/shared/project_name.rb.erb"
  ]
  s.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "bundler", "~> 1.7"
  s.add_runtime_dependency "colorize", ">= 0"
end

