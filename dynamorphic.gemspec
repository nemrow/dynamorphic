$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dynamorphic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dynamorphic"
  s.version     = Dynamorphic::VERSION
  s.authors     = ["Nemrow"]
  s.email       = ["nemrowj@gmail.com"]
  s.homepage    = "https://github.com/nemrow/dynamorphic"
  s.summary     = "Reverse Polymorphic Associations"
  s.description = "Reverse Polymorphic Associations"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
