$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "suj/kana-validator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "suj-kana-validator"
  s.version     = SUJ::KanaValidator::VERSION
  s.authors     = ["Horacio Sanson"]
  s.email       = ["horacio@skillupjapan.co.jp"]
  s.homepage    = "https://github.com/sujrd"
  s.summary     = "Kana attribute validator for Rails models"
  s.description = "Adds validates_is_full_kana method to rails attributes."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.5"
  s.add_development_dependency "sqlite3"
end
