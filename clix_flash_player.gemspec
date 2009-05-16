# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{clix_flash_player}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luke Bayes"]
  s.date = %q{2009-05-16}
  s.description = %q{This is a Command Line interface to the Flash Player for OS X.

This project was created because unlike the modern distributions of the desktop debug Flash Player on Windows and Linux, the OS X distribution does not behave properly when executed by another process.}
  s.email = ["lbayes@patternpark.com"]
  s.extra_rdoc_files = ["Manifest.txt", "History.txt", "README.rdoc"]
  s.files = ["Manifest.txt", "History.txt", "rakefile.rb", "README.rdoc", "lib/clix_flash_player.rb", "lib/clix_wrapper.rb", "script/console", "script/destroy", "script/generate", "test/clix_flash_player_test.rb", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{clix_flash_player}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{This is a Command Line interface to the Flash Player for OS X}
  s.test_files = ["test/clix_flash_player_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<open4>, [">= 0.9.6"])
      s.add_development_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<open4>, [">= 0.9.6"])
      s.add_dependency(%q<newgem>, [">= 1.3.0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<open4>, [">= 0.9.6"])
    s.add_dependency(%q<newgem>, [">= 1.3.0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
