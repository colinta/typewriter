
Gem::Specification.new do |gem|

  gem.authors  = ['Colin Thomas-Arnold']
  gem.email    = 'colinta@gmail.com'
  gem.description = <<-DESC
  Typewriter is a simple way to add views.  As long as you set the width and
  height, you can "type" them onto a `TypewriterView`.
  DESC

  gem.summary = 'Implements layoutSubviews to "type" out subviews.'
  gem.homepage = 'https://github.com/colinta/typewriter'

  gem.files   = %w(lib/typewriter/view.rb)

  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^spec/})

  gem.name          = 'typewriter'
  gem.require_paths = ['lib']
  gem.version       = '0.2.4'

  gem.add_dependency 'rake'
  gem.add_development_dependency 'rspec'

end
