# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "metar"
  s.version     = "0.0.1"
  s.authors     = ["Robert Curth"]
  s.email       = ["robert.curth@techgenossen.de"]
  s.homepage    = "https://github.com/tech-genossen/metar"
  s.summary     = "Yet another METAR Parser"
  s.description = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end