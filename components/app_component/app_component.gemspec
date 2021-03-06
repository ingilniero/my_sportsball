$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "app_component/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_component"
  s.version     = AppComponent::VERSION
  s.authors     = ["Gilberto Villa"]
  s.email       = ["ingilniero@gmail.com"]
  s.summary     = "Summary of AppComponent."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "5.1.4"
  s.add_dependency "slim-rails", "3.1.3"
  s.add_dependency "jquery-rails", "4.3.1"
  s.add_dependency "trueskill"

  s.add_development_dependency "pg", '~> 0.18'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "capybara"
  s.add_development_dependency "rails-controller-testing"
end
