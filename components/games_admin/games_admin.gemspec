$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "games_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "games_admin"
  s.version     = GamesAdmin::VERSION
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GamesAdmin."
  s.description = "TODO: Description of GamesAdmin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
