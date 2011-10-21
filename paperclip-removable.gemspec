# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  s.name        = "paperclip-removable"
  s.summary     = "Plugin for Paperclip"
  s.description = "Allows removal of previously uploaded files"
  s.version     = '0.2.0'

  s.authors     = ["Dimitrij Denissenko"]
  s.email       = "dimitrij@blacksquaremedia.com"
  s.homepage    = "https://github.com/bsm/paperclip-removable"

  s.require_path = 'lib'
  s.files        = Dir['LICENSE', 'README.rdoc', 'lib/**/*', 'rails/**/*']

  s.add_dependency "paperclip", ">= 2.3.0", "< 2.5.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3-ruby"
end
