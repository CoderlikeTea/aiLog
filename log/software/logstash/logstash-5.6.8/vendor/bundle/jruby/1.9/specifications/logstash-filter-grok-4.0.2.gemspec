# -*- encoding: utf-8 -*-
# stub: logstash-filter-grok 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "logstash-filter-grok"
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "logstash_group" => "filter", "logstash_plugin" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Elastic"]
  s.date = "2018-01-29"
  s.description = "This gem is a Logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program"
  s.email = "info@elastic.co"
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.licenses = ["Apache License (2.0)"]
  s.rubygems_version = "2.4.8"
  s.summary = "Parses unstructured event data into fields"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.60"])
      s.add_runtime_dependency(%q<logstash-core>, [">= 5.6.0"])
      s.add_runtime_dependency(%q<jls-grok>, ["~> 0.11.3"])
      s.add_runtime_dependency(%q<stud>, ["~> 0.0.22"])
      s.add_runtime_dependency(%q<logstash-patterns-core>, [">= 0"])
      s.add_development_dependency(%q<logstash-devutils>, ["= 1.3.6"])
    else
      s.add_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.60"])
      s.add_dependency(%q<logstash-core>, [">= 5.6.0"])
      s.add_dependency(%q<jls-grok>, ["~> 0.11.3"])
      s.add_dependency(%q<stud>, ["~> 0.0.22"])
      s.add_dependency(%q<logstash-patterns-core>, [">= 0"])
      s.add_dependency(%q<logstash-devutils>, ["= 1.3.6"])
    end
  else
    s.add_dependency(%q<logstash-core-plugin-api>, ["<= 2.99", ">= 1.60"])
    s.add_dependency(%q<logstash-core>, [">= 5.6.0"])
    s.add_dependency(%q<jls-grok>, ["~> 0.11.3"])
    s.add_dependency(%q<stud>, ["~> 0.0.22"])
    s.add_dependency(%q<logstash-patterns-core>, [">= 0"])
    s.add_dependency(%q<logstash-devutils>, ["= 1.3.6"])
  end
end
