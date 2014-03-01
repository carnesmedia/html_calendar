$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "html_calendar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "html_calendar"
  s.version     = HtmlCalendar::VERSION
  s.authors     = ["Amiel Martin", "Nathan Carnes"]
  s.email       = ["amiel@carnesmedia.com", "nathan@carnesmedia.com"]
  s.homepage    = "https://github.com/carnesmedia/html_calendar"
  s.summary     = "Generate nice little html calendars"
  s.description = "TODO: A better description"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
end
