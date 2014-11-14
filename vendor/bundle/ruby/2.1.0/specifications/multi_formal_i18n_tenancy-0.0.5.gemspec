# -*- encoding: utf-8 -*-
# stub: multi_formal_i18n_tenancy 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "multi_formal_i18n_tenancy"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mathias Gawlista"]
  s.date = "2012-07-21"
  s.description = "Your locales about polite form of address will inherit translations from their base locale and locales stored in a tenant directory can override base + formal translations "
  s.email = ["gawlista@googlemail.com"]
  s.homepage = "http://github.com/Applicat/multi_formal_i18n_tenancy"
  s.rubygems_version = "2.2.2"
  s.summary = "Your locales about polite form of address will inherit translations from their base locale and locales stored in a tenant directory can override base + formal translations"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.11.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.11.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.11.0"])
  end
end
