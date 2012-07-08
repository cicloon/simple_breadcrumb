# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_breadcrumb/version"

Gem::Specification.new do |s|
  s.name        = "simple_breadcrumb"
  s.version     = SimpleBreadcrumb::VERSION
  s.authors     = ["Cicloon"]
  s.email       = ["aleon.prof@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{This gem aims to create breadcrumbs with a death simple DSL}
  s.description = %q{Tired of creating breadcrumbs on each project I worked, I decided to create this gem}

  s.rubyforge_project = "simple_breadcrumb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_development_dependency "rspec", "~> 2.11.0"


end
