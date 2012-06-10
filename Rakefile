$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'


dirs = ['lib', 'app']


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.files = dirs.map{|d| Dir.glob(File.join(app.project_dir, "#{d}/**/*.rb")) }.flatten
  app.name = 'BoxFloat'
end
