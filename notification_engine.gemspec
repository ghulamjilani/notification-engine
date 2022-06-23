require_relative 'lib/notification_engine/version'

Gem::Specification.new do |spec|
  spec.name        = 'notification_engine'
  spec.version     = NotificationEngine::VERSION
  spec.authors     = ['ghulamjilani']
  spec.email       = ['ghulamjilanideveloper@gmail.com']
  spec.summary     = 'Notification Engine.'
  spec.license     = 'MIT'
  
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency 'rails', '>= 7.0.0'
end
