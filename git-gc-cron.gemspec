# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "git_gc_cron/version"

Gem::Specification.new do |s|
  s.name        = "git-gc-cron"
  s.version     = GitGcCron::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Ritz"]
  s.email       = ["thomas@galaxy-ritz.de"]
  s.homepage    = ""
  s.summary     = %q{Let cron run "git gc" on all your git repos}
  s.description = %q{git-gc-cron recursively searches for git repos in the directories specified on the command line and runs "git gc" on them.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ["LICENSE", "README"]
  s.rdoc_options  = ["--charset=UTF-8"]

  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
end
