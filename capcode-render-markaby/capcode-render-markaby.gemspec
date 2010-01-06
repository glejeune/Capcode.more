# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capcode-render-markaby}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gregoire Lejeune"]
  s.date = %q{2010-01-06}
  s.description = %q{Capcode plugin to render via Markaby}
  s.email = %q{gregoire.lejeune@free.fr}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "examples/render-markaby.rb",
     "lib/capcode/render/markaby.rb"
  ]
  s.homepage = %q{http://github.com/glejeune/Capcode.more/tree/master/capcode-render-markaby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Capcode plugin to render via Markaby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<Markaby>, [">= 0"])
    else
      s.add_dependency(%q<Markaby>, [">= 0"])
    end
  else
    s.add_dependency(%q<Markaby>, [">= 0"])
  end
end

