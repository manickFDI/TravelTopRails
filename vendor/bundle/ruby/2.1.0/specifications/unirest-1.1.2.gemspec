# -*- encoding: utf-8 -*-
# stub: unirest 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "unirest"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mashape", "Marco Palladino"]
  s.date = "2014-02-18"
  s.description = "Unirest is a set of lightweight HTTP libraries available in multiple languages."
  s.email = "support@mashape.com"
  s.homepage = "https://github.com/Mashape/unirest-ruby"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new("~> 2.0")
  s.rubygems_version = "2.2.2"
  s.summary = "Unirest-Ruby"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.6.7"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8.1"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.3.5"])
      s.add_development_dependency(%q<shoulda>, ["~> 3.5.0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rest-client>, ["~> 1.6.7"])
      s.add_dependency(%q<json>, ["~> 1.8.1"])
      s.add_dependency(%q<addressable>, ["~> 2.3.5"])
      s.add_dependency(%q<shoulda>, ["~> 3.5.0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 1.6.7"])
    s.add_dependency(%q<json>, ["~> 1.8.1"])
    s.add_dependency(%q<addressable>, ["~> 2.3.5"])
    s.add_dependency(%q<shoulda>, ["~> 3.5.0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
