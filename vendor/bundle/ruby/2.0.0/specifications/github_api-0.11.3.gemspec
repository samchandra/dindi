# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "github_api"
  s.version = "0.11.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Piotr Murach"]
  s.date = "2014-02-22"
  s.description = " Ruby wrapper that supports all of the GitHub API v3 methods(nearly 200). It's build in a modular way, that is, you can either instantiate the whole api wrapper Github.new or use parts of it e.i. Github::Repos.new if working solely with repositories is your main concern. "
  s.email = ""
  s.homepage = "http://peter-murach.github.io/github/"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Ruby wrapper for the GitHub API v3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, ["~> 2.3"])
      s.add_runtime_dependency(%q<hashie>, [">= 1.2"])
      s.add_runtime_dependency(%q<faraday>, ["< 0.10", "~> 0.8"])
      s.add_runtime_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<descendants_tracker>, ["~> 0.0.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.3"])
      s.add_development_dependency(%q<webmock>, ["~> 1.17"])
      s.add_development_dependency(%q<vcr>, ["~> 2.6"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.6.7"])
      s.add_development_dependency(%q<guard>, ["~> 1.8.1"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 3.0.2"])
      s.add_development_dependency(%q<guard-cucumber>, ["~> 1.4"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
    else
      s.add_dependency(%q<addressable>, ["~> 2.3"])
      s.add_dependency(%q<hashie>, [">= 1.2"])
      s.add_dependency(%q<faraday>, ["< 0.10", "~> 0.8"])
      s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_dependency(%q<descendants_tracker>, ["~> 0.0.1"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<cucumber>, ["~> 1.3"])
      s.add_dependency(%q<webmock>, ["~> 1.17"])
      s.add_dependency(%q<vcr>, ["~> 2.6"])
      s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
      s.add_dependency(%q<coveralls>, ["~> 0.6.7"])
      s.add_dependency(%q<guard>, ["~> 1.8.1"])
      s.add_dependency(%q<guard-rspec>, ["~> 3.0.2"])
      s.add_dependency(%q<guard-cucumber>, ["~> 1.4"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<addressable>, ["~> 2.3"])
    s.add_dependency(%q<hashie>, [">= 1.2"])
    s.add_dependency(%q<faraday>, ["< 0.10", "~> 0.8"])
    s.add_dependency(%q<multi_json>, ["< 2.0", ">= 1.7.5"])
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
    s.add_dependency(%q<descendants_tracker>, ["~> 0.0.1"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<cucumber>, ["~> 1.3"])
    s.add_dependency(%q<webmock>, ["~> 1.17"])
    s.add_dependency(%q<vcr>, ["~> 2.6"])
    s.add_dependency(%q<simplecov>, ["~> 0.7.1"])
    s.add_dependency(%q<coveralls>, ["~> 0.6.7"])
    s.add_dependency(%q<guard>, ["~> 1.8.1"])
    s.add_dependency(%q<guard-rspec>, ["~> 3.0.2"])
    s.add_dependency(%q<guard-cucumber>, ["~> 1.4"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
  end
end
