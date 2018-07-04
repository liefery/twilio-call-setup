# frozen_string_literal: true

require File.expand_path(
  File.join("..", "lib", "twilio_call_setup", "version"),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.name                  = "twilio-call-setup"
  gem.version               = TwilioCallSetup::VERSION
  gem.platform              = Gem::Platform::RUBY
  gem.summary               = "..."
  gem.description           = "..."
  gem.authors               = "Liefery"
  gem.email                 = "jonas.huebotter@liefery.com"
  gem.homepage              = "https://github.com/liefery/twilio-call-setup"
  gem.license               = "MIT"

  gem.files                 = Dir["README.md", "lib/**/*"]
  gem.require_paths         = ["lib"]

  gem.required_ruby_version = ">= 2.3.3"

  gem.add_dependency "twilio-ruby", "~> 5.10"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rubocop"
  gem.add_development_dependency "rubocop-rspec"
end
