# -*- encoding: utf-8 -*-
require File.expand_path('../lib/typewriter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'typewriter'
  gem.version       = Typewriter::Version

  gem.authors       = ["Colin Thomas-Arnold"]
  gem.email         = ["colinta@gmail.com"]
  gem.description = <<-DESC
Typewriter is a simple way to add views.  As long as you set the width and
height, you can "type" them onto a `Typewriter::View`.
DESC
  gem.summary       = 'Implements layoutSubviews to "type" out subviews.'
  gem.homepage      = 'https://github.com/colinta/typewriter'

  gem.require_paths = ['lib']
  gem.files        = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^spec/})

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'

end
