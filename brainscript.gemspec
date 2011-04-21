# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brainscript/version"

Gem::Specification.new do |s|
  s.name        = "brainscript"
  s.version     = Brainscript::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josep M. Bach"]
  s.email       = ["josep.m.bach@gmail.com"]
  s.homepage    = "http://github.com/txus/brainscript"
  s.summary     = %q{Brainscript is a scripting language that compiles to clean, readable Brainfuck.}
  s.description = %q{Brainscript is a scripting language that compiles to clean, readable Brainfuck.}

  s.rubyforge_project = "brainscript"

  s.add_runtime_dependency 'parslet'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'bluecloth'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
