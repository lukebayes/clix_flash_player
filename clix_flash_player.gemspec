# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{clix_flash_player}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luke Bayes"]
  s.date = %q{2009-05-17}
  s.description = %q{The Flash Player on OS X does not appropriately allow the command line to control it.}
  s.email = %q{josh@technicalpickles.com}
  s.extra_rdoc_files = [
    "README.rdoc",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "README.rdoc",
     "README.textile",
     "VERSION",
     "clix_flash_player.gemspec",
     "lib/clix_flash_player.rb",
     "lib/clix_wrapper.rb",
     "rakefile.rb",
     "script/console",
     "script/destroy",
     "script/generate",
     "test/clix_flash_player_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/technicalpickles/the-perfect-gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Command Line Interface wrapper for Flash Player on OS X}
  s.test_files = [
    "test/clix_flash_player_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<open4>, [">= 0.9.6"])
    else
      s.add_dependency(%q<open4>, [">= 0.9.6"])
    end
  else
    s.add_dependency(%q<open4>, [">= 0.9.6"])
  end
end
