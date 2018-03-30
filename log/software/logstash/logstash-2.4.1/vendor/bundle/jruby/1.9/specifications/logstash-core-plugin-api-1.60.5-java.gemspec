# -*- encoding: utf-8 -*-
# stub: logstash-core-plugin-api 1.60.5 java lib

Gem::Specification.new do |s|
  s.name = "logstash-core-plugin-api"
  s.version = "1.60.5"
  s.platform = "java"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Elastic"]
  s.date = "2016-11-07"
  s.description = "Logstash plugin API"
  s.email = ["info@elastic.co"]
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.licenses = ["Apache License (2.0)"]
  s.rubygems_version = "2.4.8"
  s.summary = "Define the plugin API that the plugin need to follow."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-core>, ["<= 2.4.99", ">= 2.4.1"])
    else
      s.add_dependency(%q<logstash-core>, ["<= 2.4.99", ">= 2.4.1"])
    end
  else
    s.add_dependency(%q<logstash-core>, ["<= 2.4.99", ">= 2.4.1"])
  end
end
